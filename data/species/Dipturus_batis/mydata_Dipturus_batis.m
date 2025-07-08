function [data, auxData, metaData, txtData, weights] = mydata_Dipturus_batis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Dipturus_batis'; 
metaData.species_en = 'Common skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 29];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 1.3*365; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(9.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 100*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'Wiki';   
  temp.am = C2K(9.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 22.3;   units.Lb  = 'cm';  label.Lb  = 'pelvic length at birth'; bibkey.Lb  = 'Wiki';
data.Lp  = 123;   units.Lp  = 'cm';  label.Lp  = 'pelvic length at puberty for females';   bibkey.Lp  = 'fishbase';
data.Lpm = 115;    units.Lpm  = 'cm';  label.Lpm  = 'pelvic length at puberty  for males';   bibkey.Lpm  = 'fishbase';
data.Li  = 285; units.Li  = 'cm';  label.Li  = 'ultimate pelvic length for females';   bibkey.Li  = 'fishbase';

data.Wwi = 113e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Wiki';

data.Ri  = 40/365/2; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = {'fishbase','Wiki'};   
  temp.Ri = C2K(9.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'fishbase give 40 eggs per yr, Wiki give reproduction each 2 yrs';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.878	31.862
2.056	45.083
2.966	55.548
3.982	74.248
4.946	83.619
5.991	93.542
7.064	96.334
8.107	112.292
9.127	113.985
10.118	120.613
11.083	128.887
11.995	132.769
12.957	147.626
13.948	157.547
14.914	161.980
16.895	184.016
19.870	202.805
21.934	217.164];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(9.8); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Buit1977';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.000	20.848
1.012	35.708
2.055	48.923
3.019	59.391
3.956	70.955
5.027	81.428
6.018	92.995
6.956	99.072
8.000	108.995
9.153	115.083
10.037	123.902
11.109	132.180
11.886	139.348
13.039	144.338
13.922	154.254
14.941	158.141
15.880	161.475
16.952	168.657
17.891	172.540
18.937	175.879
19.875	181.409
20.921	186.943
21.940	190.830
22.906	192.520];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(9.8); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Buit1977';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.kap = 3 * weights.psd.kap;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '36R33'; % Cat of Life
metaData.links.id_ITIS = '564126'; % ITIS
metaData.links.id_EoL = '46560468'; % Ency of Life
metaData.links.id_Wiki = 'Dipturus_batis'; % Wikipedia
metaData.links.id_ADW = 'Dipturus_batis'; % ADW
metaData.links.id_Taxo = '108256'; % Taxonomicon
metaData.links.id_WoRMS = '105869'; % WoRMS
metaData.links.id_fishbase = 'Dipturus-batis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dipturus_batis}}'; 
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
bibkey = 'Buit1977'; type = 'Article'; bib = [ ... 
'author = {Marie Henriette Du Buit}, ' ...
'year = {1977}, ' ...
'title  = {Age et croissance de \emph{Raja batis} et de \emph{Raja naevus} en {M}er {C}eltique}, ' ...
'journal = {J. Cons. int. Explor. Mer.}, ' ...
'volume = {37(3)}, ' ...
'pages = {261-265}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Dipturus-batis.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

