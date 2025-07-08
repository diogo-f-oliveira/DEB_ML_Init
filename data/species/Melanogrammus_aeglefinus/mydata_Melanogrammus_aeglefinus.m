function [data, auxData, metaData, txtData, weights] = mydata_Melanogrammus_aeglefinus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Gadidae';
metaData.species    = 'Melanogrammus_aeglefinus'; 
metaData.species_en = 'Haddock'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', '0iMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % in K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ww_L'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 14]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'}; 
metaData.date_mod_1     = [2019 03 10]; 
metaData.email_mod_1    = {'bas.kooijman@vu.nl'}; 
metaData.address_mod_1  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 10]; 

%% set data
% zero-variate data
data.ab = 13;       units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'fishbase';    
  temp.ab = C2K(5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ab2 = 15;       units.ab2 = 'd';  label.ab2 = 'age at birth';               bibkey.ab2 = 'fishbase';    
  temp.ab2 = C2K(2.8); units.temp.ab2 = 'K'; label.temp.ab2 = 'temperature';
data.ap = 1.8*365;  units.ap = 'd';    label.ap = 'age at puberty for female';   bibkey.ap = 'ICES'; 
  temp.ap = C2K(6); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 20*365;   units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';  
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 34.9;     units.Lp = 'cm';   label.Lp = 'total length at puberty';     bibkey.Lp = 'fishbase';
data.Li = 112;      units.Li = 'cm';   label.Li = 'ultimate total length';       bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'ICES';
  comment.Wwb = 'based on egg diameter of 1.2 till 1.7 mm: 4/3*pi*0.075^3';
data.Ww40 = 630; units.Ww40 = 'g';   label.Ww40 = 'wet weight at length of 40 cm'; bibkey.Ww40 = 'ICES';
data.Wwp = 361;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.0157 * Lp^2.8268, see F4';
data.Wwi = 16800;     units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase'; 

data.Ri = 3.15e5/365; units.Ri = '#/d';  label.Ri = 'reprod rate at 640 g or 40 cm'; bibkey.Ri = 'Wiki';
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_1995 = [ ... % age (years), Length (cm) 
1.007	18.428
2.007	30.666
2.995	39.711
4.003	47.104
5.033	53.946
5.997	58.254
7.036	60.581
8.032	63.128];
data.tL_1995(:,1) = 365 * data.tL_1995(:,1); % convert yr to d
units.tL_1995 = {'d', 'cm'}; label.tL_1995 = {'time since birth', 'total length'};  
temp.tL_1995 = C2K(6);  units.temp.tL_1995 = 'K'; label.temp.tL_1995 = 'temperature';
bibkey.tL_1995 = 'BollRijn2004';
comment.tL_1995 = 'Data for catches during 1995-1999 in the North Sea';
%
data.tL_1425 = [ ... % age (years), Length (cm)            
1.006	15.454
1.972	24.388
2.980	30.790
4.020	35.540
5.005	38.968
5.990	41.734
6.997	45.162
8.003	46.938];
data.tL_1425(:,1) = 365 * data.tL_1425(:,1); % convert yr to d
units.tL_1425 = {'d', 'cm'}; label.tL_1425 = {'time since birth', 'total length'};  
temp.tL_1425 = C2K(6);  units.temp.tL_1425 = 'K'; label.temp.tL_1425 = 'temperature';
bibkey.tL_1425 = 'BollRijn2004';
comment.tL_1425 = 'Data for catches during 1425-1800 in the North Sea';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
  
%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_1995','tL_1425'}; subtitle1 = {'Data for 1995, 1425'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Preferred temperature 2 till 10 C';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Females are slightly larger than males and mature later, but differences are small';
metaData.bibkey.F2 = 'ICES'; 
F3 = 'Pelagic till 7 cm, then demersal';
metaData.bibkey.F3 = 'ICES'; 
F4 = 'Length-Weight relationship: W in g = 0.0157 * (L in cm)^2.8268';
metaData.bibkey.F4 = 'ICES'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '3Z8JC'; % Cat of Life
metaData.links.id_ITIS = '164744'; % ITIS
metaData.links.id_EoL = '46564420'; % Ency of Life
metaData.links.id_Wiki = 'Melanogrammus_aeglefinus'; % Wikipedia
metaData.links.id_ADW = 'Melanogrammus_aeglefinus'; % ADW
metaData.links.id_Taxo = '92958'; % Taxonomicon
metaData.links.id_WoRMS = '126437'; % WoRMS
metaData.links.id_fishbase = 'Melanogrammus-aeglefinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Melanogrammus_aeglefinus}}';
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
bibkey = 'BollRijn2004'; type = 'article'; bib = [ ...
'author = {L. J. Bolle and A. D. Rijnsdorp and W. van Neer and R. S. Millner and P. I. van Leeuwen and A. Ervynck and R. Ayers and E. Ongenae}, ' ... 
'year   = {2004}, ' ...
'title  = {Growth changes in plaice, cod, haddock and saithe in the {N}orth {S}ea: a comparison of (post-)medieval and present-day growth rates based on otolith measurements}, ' ...
'journal = {Journal of Sea Research}, ' ...
'page = {313-328}, ' ...
'volume = 51}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoneHisl1972'; type = 'article'; bib = [ ...
'author = {Jones, R. and Hislop, J. R. G.}, ' ...
'year   = {1972}, ' ...
'title  = {Investigations into the growth of haddock, \emph{Melanogrammus aeglefinud} ({L}.) and whiting, \emph{Merlangius merlangus} ({L}.) in aquaria}, ' ...
'journal = {J. Cons. int. Explor. Mer.}, ' ...
'page = {174-189}, ' ...
'volume = {34}, ' ...
'issue = {2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MartKieff2005'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1095-8649.2005.00699.x}, ' ...
'author = {D. J. Martell and J. D. Kieffer and E. A. Trippel}, ' ...
'year   = {2005}, ' ...
'title  = {Effects of temperature during early life history on embryonic and larval development and growth in haddock}, ' ...
'journal = {Journal of Fish Biology () , }, ' ...
'page = {1558-1575}, ' ...
'volume = {66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1381}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ICES'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.ices.dk/explore-us/projects/EU-RFP/EU Repository/ICES FIshMap/ICES FishMap species factsheet-haddock.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

