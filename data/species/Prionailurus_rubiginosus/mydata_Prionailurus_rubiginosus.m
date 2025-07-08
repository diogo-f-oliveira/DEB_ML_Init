function [data, auxData, metaData, txtData, weights] = mydata_Prionailurus_rubiginosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Prionailurus_rubiginosus'; 
metaData.species_en = 'Rusty-spotted cat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 69;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Dmoc1997';   
  temp.tg = C2K(38.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '67 till 71 d';
data.tx = 60;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'EoL';   
  temp.tx = C2K(38.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '7 till 10 mnth';
data.tp = 365;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'EoL';
  temp.tp = C2K(38.4); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17.9*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.4); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Based on Lynx lynx';

data.Wwb = 70; units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Andr2003';
data.Wwi = 1500;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'Dmoc1997';
  comment.Wwi = 'based on extrapolation of growth curve';
data.Wwim = 1700;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';     bibkey.Wwim = 'Dmoc1997';
  comment.Wwim = 'based on extrapolation of growth curve';

data.Ri  = 2.5/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(38.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Dmoc1997: 1.3 pups per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (10g)
38.863	499.401
48.976	626.102
58.076	675.651
67.768	620.619
75.605	732.443
86.027	829.259
94.485	891.273
103.249	918.425
113.629	938.064
122.382	945.298
132.437	962.457
141.862	1014.486
149.656	1046.643
160.382	1106.107
169.483	1158.145
178.886	1167.852
187.649	1195.003
197.374	1202.212
206.476	1254.250
215.560	1273.924
225.274	1261.216];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(38.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Dmoc1997';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
39.144	419.726
48.262	504.129
58.649	536.216
67.401	540.961
75.590	705.057
85.994	769.509
94.457	838.992
104.850	883.527
112.992	957.998
122.740	1007.529
131.821	1022.224
141.258	1096.660
151.017	1166.109
160.117	1215.657
169.238	1305.040
179.622	1332.148
188.059	1354.329
197.151	1388.940
206.555	1401.136
215.332	1453.184
225.021	1393.173];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(38.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Dmoc1997';
comment.tW_m = 'Data for males';

data.tW = [ ... % time since birth (d), wet weight (g)
    0  70
    7 131
   14 185
   21 255
   28 308
   35 363];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Andr2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females and males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4MF7F'; % Cat of Life
metaData.links.id_ITIS = '552774'; % ITIS
metaData.links.id_EoL = '312856'; % Ency of Life
metaData.links.id_Wiki = 'Prionailurus_rubiginosus'; % Wikipedia
metaData.links.id_ADW = 'Prionailurus_rubiginosus'; % ADW
metaData.links.id_Taxo = '67242'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000195'; % MSW3
metaData.links.id_AnAge = 'Prionailurus_rubiginosus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prionailurus_rubiginosus}}';
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
bibkey = 'Dmoc1997'; type = 'article'; bib = [ ... 
'author = {R. Dmoch}, ' ... 
'year = {1997}, ' ...
'title = {Husbandery, breeding and population development of the {Sri Lankan} rusty-spotted cat \emph{Prionailurus rubiginosus phillipsi} }, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {35}, '...
'pages = {115-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Prionailurus_rubiginosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/312856/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Andr2003'; type = 'article'; bib = [ ... 
'author = {Andrews, P.}, ' ... 
'year = {2003}, ' ...
'title = {Hand-Rearing of SmallFelids}, ' ...
'institution = {Hexagon Farm Wild Feline Breeding Facility}, ' ...
'howpublished = {\url{https://aszk.org.au/wp-content/uploads/2020/05/Hand-RearingSmallFelidsPennyAndrewsHexagonFarms.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

