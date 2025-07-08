function [data, auxData, metaData, txtData, weights] = mydata_Sufflogobius_bibarbatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Sufflogobius_bibarbatus'; 
metaData.species_en = 'Pelagic goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0pMcp','piMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 13];

%% set data
% zero-variate data

data.ab = 6;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'SalvChri2018';
  temp.ab = C2K(19);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'actually hatch at 7 d';
data.am = 7.5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'SalvChri2018';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'SalvChri2018'; 
data.Li  = 17;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 4.77e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'SalvChri2018';
  comment.Wwb = 'based on egg length of 0.45 mm: pi/6*0.045^3';
data.Wwp = 2.3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','SalvChri2018'};
  comment.Wwp = 'based on 0.01023*Lp^3.02, see F1';
data.Wwi = 53.2;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.02, see F1';

data.Ri = 53e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'SalvChri2018';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on rel fecundity of 1000 egg/g: 53*1000';

% uni-variate data
% time-length
data.tL_tm = [... %  yr class (yr), total length (cm)
4.800	12.578
4.970	12.157
5.006	11.142
5.030	12.261
5.042	11.422
5.067	10.442
5.079	11.351
5.091	11.981
5.164	12.260
5.818	11.555
5.830	11.869
5.988	10.469
6.061	11.972
6.097	13.580
6.145	13.405
6.885	13.224
6.897	11.930
6.933	13.818
7.127	12.452
7.200	13.536];
data.tL_tm(:,1) = 365 * (.5 + data.tL_tm(:,1)); 
units.tL_tm   = {'d', 'cm'};  label.tL_tm = {'time since birth', 'total length','territorial males'};  
temp.tL_tm   = C2K(13);  units.temp.tL_tm = 'K'; label.temp.tL_tm = 'temperature';
bibkey.tL_tm = 'SalvChri2018'; 
%
data.tL_sm = [... %  yr class (yr), total length (cm)
1.103	7.016
1.818	7.918
1.879	7.114
1.903	8.302
1.964	6.658
2.000	7.742
2.024	7.392
2.194	7.496
2.824	8.189
2.897	6.790
2.958	8.713
2.994	7.034
3.079	6.544
3.952	8.774
4.109	9.157
4.145	9.751
5.018	9.883];
data.tL_sm(:,1) = 365 * (.5 + data.tL_sm(:,1)); 
units.tL_sm   = {'d', 'cm'};  label.tL_sm = {'time since birth', 'total length','sneaker males'};  
temp.tL_sm   = C2K(13);  units.temp.tL_sm = 'K'; label.temp.tL_sm = 'temperature';
bibkey.tL_sm = 'SalvChri2018'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_tm = 3 * weights.tL_tm;
weights.tL_sm = 3 * weights.tL_sm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_tm','tL_sm'}; subtitle1 = {'Data for territorial, sneaker males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'sneaker males are assumed not to differ from females, but territorial males are somewhat larger (differ in {p_Am})';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6PQXZ'; % Cat of Life
metaData.links.id_ITIS = '172036'; % ITIS
metaData.links.id_EoL = '46575257'; % Ency of Life
metaData.links.id_Wiki = 'Sufflogobius_bibarbatus'; % Wikipedia
metaData.links.id_ADW = 'Sufflogobius_bibarbatus'; % ADW
metaData.links.id_Taxo = '178687'; % Taxonomicon
metaData.links.id_WoRMS = '126904'; % WoRMS
metaData.links.id_fishbase = 'Sufflogobius-bibarbatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sufflogobius_bibarbatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SalvChri2018'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.jmarsys.2018.04.003}, ' ...
'author = {Anne Gro Vea Salvanes and Henrik Christiansen and Yusra Taha and Christina Henseler and Maria Larsen Seiv{\aa}g and Olav Sigurd Kjesbu and Arild Folkvord and Anne Christine Utne-Palm Bronwen Currie and Werner Ekau and Anja K. van der Plas and Mark J. Gibbons}, ' ... 
'year = {2018}, ' ...
'title = {Variation in growth, morphology and reproduction of the bearded goby (\emph{Sufflogobius bibarbatus}) in varying oxygen environments of northern {B}enguela}, ' ...
'journal = {Journal of Marine Systems}, ' ...
'volume = {188}, ' ...
'pages = {81-97}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Sufflogobius-bibarbatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

