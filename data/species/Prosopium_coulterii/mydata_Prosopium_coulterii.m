function [data, auxData, metaData, txtData, weights] = mydata_Prosopium_coulterii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Prosopium_coulterii'; 
metaData.species_en = 'Pygmy whitefish';

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2020 06 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data

data.tp = 3*365;     units.tp = 'd';    label.tp = 'time since birth ar puberty'; bibkey.tp = 'StewOgle2016';   
  temp.tp = C2K(9);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'between 2 and 4 yr';
data.am = 9*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Li  = 29;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 8.9e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 2.57 mm: pi/6*0.257^3';
data.Wwi = 183; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00378*Li^3.204, see F1';

data.Ri  = 1153/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [... %  time since birth (yr), total length (cm)
0.948	5.460
0.949	5.730
0.952	6.844
0.963	5.899
0.990	6.017
1.004	6.152
1.940	8.534
1.940	8.720
1.949	7.184
1.979	8.213
1.995	8.939
2.938	9.633
2.939	9.819
2.950	9.110
2.964	9.245
2.980	10.055
3.946	9.365
3.965	11.019
3.967	11.745
3.976	10.226
3.984	12.656
4.964	12.186
4.967	13.047
4.977	12.000
5.965	13.926
6.006	14.230
6.999	13.608
7.969	14.319
7.970	14.437
7.993	13.424
9.020	15.064];
data.tL_f(:,1) = (0.9 + data.tL_f(:,1)) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StewOgle2016';
comment.tL_f = 'Data for females';
%
data.tL_m = [... %  time since birth (yr), fork length (cm)
1.034	6.996
1.044	6.186
1.045	6.389
1.069	5.494
1.069	5.612
1.070	5.714
2.017	7.437
2.038	9.851
2.043	7.252
2.047	8.534
3.030	8.924
3.043	8.705
3.044	9.043
3.044	9.195
3.056	8.536
3.072	9.549
4.014	9.669
4.065	8.944
5.036	9.823
6.063	11.091
6.067	12.458
7.055	10.418];
data.tL_m(:,1) = (0.9 + data.tL_m(:,1)) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StewOgle2016';
comment.tL_m = 'data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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

%% Facts
F1 = 'weight-length: Ww in g = 0.00378*(TL in cm)^3.204';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4MW92'; % Cat of Life
metaData.links.id_ITIS = '553389'; % ITIS
metaData.links.id_EoL = '223835'; % Ency of Life
metaData.links.id_Wiki = 'Prosopium_coulterii'; % Wikipedia
metaData.links.id_ADW = 'Prosopium_coulterii'; % ADW
metaData.links.id_Taxo = '547856'; % Taxonomicon
metaData.links.id_WoRMS = '567545'; % WoRMS
metaData.links.id_fishbase = 'Prosopium-coulterii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prosopium_coulterii}}';
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
bibkey = 'Shes2017'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945217020175}, ' ...
'author = {A. V. Shestakov}, ' ... 
'year = {2017}, ' ...
'title = {Biology of Round Whitefish \emph{Prosopium cylindraceum} ({C}oregonidae) of the {A}nadyr {R}iver}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {57}, ' ...
'pages = {257-264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StewOgle2016'; type = 'Article'; bib = [ ... 
'doi = {10.1674/amid-175-01-24-36.1}, ' ...
'author = {Taylor R. Stewart and Derek H. Ogle and Owen T. Gorman and Mark R. Vinson}, ' ... 
'year = {2016}, ' ...
'title = {Age, Growth, and Size of Lake Superior Pygmy Whitefish (\emph{Prosopium coulterii})}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {175}, ' ...
'pages = {24-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Prosopium-coulterii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

