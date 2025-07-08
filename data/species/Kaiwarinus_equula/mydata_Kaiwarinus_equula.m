function [data, auxData, metaData, txtData, weights] = mydata_Kaiwarinus_equula
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Kaiwarinus_equula'; 
metaData.species_en = 'Whitefin trevally'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 02 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 17];

%% set data
% zero-variate data
data.ab = 9;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(20.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'FutaYone2000';   
  temp.am = C2K(20.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17.7; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'YoneFuta2002';
data.Li = 50;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 7.0e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'YoneFuta2002';
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*0.11^3';
data.Wwp = 64.5;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'YoneFuta2002','fishbase'};
  comment.Wwp = 'based on 0.01349*Lp^2.96, see F1';
data.Wwi = 1442; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^2.96, see F1';

% uni-variate data

% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
    1  3.9  4.1
    2  7.4  7.6
    3 10.1 10.2
    4 12.4 12.4
    5 14.3 14.3
    6 15.9 15.9
    7 17.5 17.3
    8 18.9 18.6
    9 20.0 19.7
   10 21.0 20.6
   11 22.1 21.4
   12 22.5 22.2
   13 23.5 23.0
   14 NaN  23.7];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0)*365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length'}; 
temp.tL_fm = C2K(20.6); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'FutaYone2000'; treat.tL_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % fork length (cm), fecundity (#)
17.704	19764.503
18.418	13480.399
18.750	20956.836
20.587	44784.858
20.765	23140.797
20.816	34061.115
21.020	26169.343
21.862	40511.873
22.168	61337.139
22.219	43133.862
22.577	44946.862
22.704	43730.799
23.265	55854.278
23.367	74661.206
23.852	74246.908
24.617	60478.623
24.643	80298.331];
units.LN = {'cm', '#'};  label.LN = {'fork length','batch fecundity'}; 
temp.LN = C2K(20.6); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'YoneFuta2002'; comment.LN = '2 spawnings per yr assumed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01349*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R2HY'; % Cat of Life
metaData.links.id_ITIS = '1228197'; % ITIS
metaData.links.id_EoL = '46578073'; % Ency of Life
metaData.links.id_Wiki = 'Carangoides_equula'; % Wikipedia
metaData.links.id_ADW = 'Kaiwarinus_equula'; % ADW
metaData.links.id_Taxo = '428809'; % Taxonomicon
metaData.links.id_WoRMS = '218390'; % WoRMS
metaData.links.id_fishbase = 'Kaiwarinus_equula'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Carangoides_equula}}';  
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
bibkey = 'YoneFuta2002'; type = 'article'; bib = [ ...
'doi = {10.33997/j.afs.2020.33.2.004}, '  ...
'author = {M. Yoneda  and K. Futagawaa and M. Tokimurab and H. Horikawac and S. Matsuurad and M. Matsuyama}, ' ...
'year = {2002}, ' ...
'title = {Reproductive cycle, spawning frequency and batch fecundity of the female whitefin jack \emph{Kaiwarinus equula} in the {E}ast {C}hina {S}ea}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {57}, ' ...
'pages = {297–309}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FutaYone2000'; type = 'article'; bib = [ ...
'author = {Kousei Futagawa and Michio Yoneda and Muneharu Tokimura and Hiroshi Horikawa and Michiya Matsuyama and Shuhei Matsuura}, ' ...
'year = {2000}, ' ...
'title = {Age and growth of the whitefin jack \emph{Kaiwarinus equula} in the {E}ast {C}hina {S}ea}, ' ... 
'journal = {Sci. Bull. Fac. Agr., Kyushu Univ.}, ' ...
'volume = {55}, ' ...
'pages = {13-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Kaiwarinus-equula.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
