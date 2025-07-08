function [data, auxData, metaData, txtData, weights] = mydata_Chimaera_monstrosa

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Chimaeriformes'; 
metaData.family     = 'Chimaeridae';
metaData.species    = 'Chimaera_monstrosa'; 
metaData.species_en = 'Rabbit fish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAm','MANW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 17];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 17]; 

%% set data
% zero-variate data;
data.am = 30*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'Wiki';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 16.4;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'CaliJack2005';
  comment.Lb = 'based on PSCL 12 cm and F2';
data.Lp  = 62.9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'MourFigu2004';
  comment.Lp = 'based on PSCL 45.9 cm and F2';
data.Lpm  = 55.7;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty'; bibkey.Lpm  = 'MourFigu2004';
  comment.Lpm = 'based on PSCL 40.7 cm and F2';
data.Li  = 150;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwi = 2.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 6/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'MourFigu2004';   
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), pre-supra caudal fin length (cm)
0       12
5.016	22.920
6.040	30.122
6.041	27.916
6.041	26.592
6.076	31.445
6.954	35.265
9.040	46.874
9.043	42.021
9.989	58.488
10.109	37.311
10.981	55.542
13.000	53.181
13.950	60.677
13.992	50.088
14.026	54.794
14.027	53.471
14.976	64.643
15.018	53.025
15.019	49.055
15.050	63.319
15.089	58.025
15.091	53.760
15.856	64.198
16.005	59.492
16.996	60.076
17.140	64.634
17.990	51.836
18.029	45.513
18.061	56.248
18.062	54.483
18.942	56.097
18.942	55.215
18.943	54.185
19.051	57.273
19.896	56.093
19.971	52.563
20.952	72.853
21.983	64.025
23.012	59.903
25.024	73.866];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2)/ 0.73; % convert PSCL to TL
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CaliJack2005';
comment.tL_f = 'data for females, converted from PSCL using F2';
%
data.tL_m = [ ... % time since birth (yr), pre-supra caudal fin length (cm)
0       12
5.051	26.302
5.086	29.538
7.029	33.059
8.858	43.786
8.896	41.286
12.048	47.891
16.012	44.639
17.988	55.513
19.092	48.891
24.841	71.366
28.877	71.202];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2)/ 0.73; % convert PSCL to TL
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(6); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CaliJack2005';
comment.tL_m = 'data for males, converted from PSCL using F2';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00219*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: pre-supra caudal fin length PSCL = 0.73*TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5XRXH'; % Cat of Life
metaData.links.id_ITIS = '161022'; % ITIS
metaData.links.id_EoL = '46561101'; % Ency of Life
metaData.links.id_Wiki = 'Chimaera_monstrosa'; % Wikipedia
metaData.links.id_ADW = 'Chimaera_monstrosa'; % ADW
metaData.links.id_Taxo = '42195'; % Taxonomicon
metaData.links.id_WoRMS = '105824'; % WoRMS
metaData.links.id_fishbase = 'Chimaera-monstrosa'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chimaera_monstrosa}}'; 
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
bibkey = 'CaliJack2005'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0025315413001525}, ' ...
'author = {E. Calis and E. H. Jackson and C.P. Nolan and F. Jeal}, ' ...
'year = {2005}, ' ...
'title  = {Preliminary Age and Growth Estimates of the Rabbitfish, \emph{Chimaera monstrosa}, with Implications for Future Resource Management}, ' ...
'journal = {J. Northw. Atl. Fish. Sci.}, ' ...
'volume = {35}, ' ...
'pages = {15-26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MourFigu2004'; type = 'Article'; bib = [ ... 
'author = {Teresa Moura and Ivone Figueiredo and Pedro Bordalo Machado*and Leonel Serrano Gordo}, ' ...
'year = {2004}, ' ...
'title  = {Growth pattern and reproductive strategy of the holocephalan \emph{Chimaera monstrosa} along the {P}ortuguese continental slope}, ' ...
'journal = {J. Mar. Biol. Ass. U.K}, ' ...
'volume = {84}, ' ...
'pages = {801-804}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Chimaera-monstrosa.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

