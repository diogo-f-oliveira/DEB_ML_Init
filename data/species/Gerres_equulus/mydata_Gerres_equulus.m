function [data, auxData, metaData, txtData, weights] = mydata_Gerres_equulus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gerreiformes'; 
metaData.family     = 'Gerreidae';
metaData.species    = 'Gerres_equulus'; 
metaData.species_en = 'Japanese silver-biddy'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 09]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'IqbaSuzu2008';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'all temps are guessed; am of 10 yr is oldest year class in tL data';
  
data.Lp  = 14.1;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'IqbaSuzu2008'; 
data.Li  = 21.3;  units.Li  = 'cm';  label.Li  = 'ultimate standard length for females'; bibkey.Li  = 'IqbaMasu2006';
data.Lim  = 20.6;  units.Lim  = 'cm';  label.Lim  = 'ultimate standard length for males'; bibkey.Lim  = 'IqbaMasu2006';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based guessed egg diameter of 0.8 mm: 4/3*pi*0.04^3'; 
data.Wwp = 76.2; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'IqbaMasu2006';
  comment.Wwp = 'based on 0.022*Lp^3.08, see F1';
data.Wwi = 271.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'IqbaMasu2006';
  comment.Wwi = 'based on 0.022*Li^3.08, see F1';

% uni-variate data
% time-length
data.tL_f = [  ... % time since birth (yr), standard length (cm)
 1  7.45
 2 13.31
 3 15.94
 4 17.70
 5 18.79
 6 19.60
 7 20.18
 8 20.59
 9 21.16
10 21.62];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'IqbaMasu2006';
comment.tL_f = 'data for females';
% 
data.tL_m = [  ... % time since birth (yr), standard length (cm)
 1  6.95
 2 12.68
 3 15.23
 4 16.77
 5 17.75
 6 18.59
 7 19.28
 8 19.88
 9 20.56
10 20.82];
data.tL_m(:,1) = 365 * (0.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'IqbaMasu2006';
comment.tL_m = 'data for males';

% length-fecundenty for June-July
data.LNj = [  ... %  standard length (cm), fecundity
14.351	23257.779
14.956	15010.091
15.292	35775.281
15.510	22832.895
15.790	39802.397
16.257	33337.880
16.387	52313.495
16.495	45842.302
16.786	50981.641
16.992	48083.691
17.489	46530.420
17.880	66850.209
18.487	65968.635
18.496	49897.379
18.570	68648.759
18.706	60838.784
18.765	73116.658
18.791	68652.864
18.999	71335.298
19.001	79147.836
19.189	60847.765
19.208	78482.040
19.299	59510.527
19.533	58845.239
19.539	79157.842
19.591	69783.822
19.983	87648.240
20.062	74703.283
21.391	92808.364
21.694	90805.072];
units.LNj   = {'cm', '#'};  label.LNj = {'standard length', 'fecundity', 'June-July'};  
temp.LNj   = C2K(18);  units.temp.LNj = 'K'; label.temp.LNj = 'temperature';
bibkey.LNj = 'IqbaSuzu2008';
comment.LNj = 'data for June-July';
% length-fecundenty for August-September
data.LNa = [  ... %  standard length (cm), fecundity
14.088	20127.888
14.985	19698.129
15.895	20831.144
15.953	31323.291
16.078	32441.681
16.285	34900.901
16.380	27983.010
16.382	34456.261
16.491	31110.079
16.492	34458.313
16.493	36467.258
16.671	32452.714
16.863	29331.289
16.878	34465.497
16.975	36699.446
17.016	33575.200
17.167	31345.869
17.277	31124.703
17.485	34923.223
17.700	64168.284
17.792	45196.770
17.802	33813.043
17.988	58816.503
18.065	36942.934
18.100	63729.298
18.368	36278.933
18.479	38513.134
18.481	43423.877
18.520	35835.319
18.757	45661.161
18.758	48562.964
18.881	43654.531
18.950	44771.890
19.102	45444.362
19.116	46337.477
19.184	42544.099
19.578	72015.719
19.682	47910.505
19.730	72911.404
19.919	55950.625
20.069	50819.492
20.077	81400.004
20.791	69136.499
20.998	69809.993
21.205	69590.628
21.401	78969.266
21.495	68479.939
21.691	78974.654];
units.LNa   = {'cm', '#'};  label.LNa = {'standard length', 'fecundity', 'August-September'};  
temp.LNa   = C2K(18);  units.temp.LNa = 'K'; label.temp.LNa = 'temperature';
bibkey.LNa = 'IqbaSuzu2008';
comment.LNa = 'data for August-September';

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LNj','LNa'}; subtitle2 = {'Data for June, August'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Assumed: 2 batches per yr with partial early spawning';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'weight-length relationship: W = 0.022*SL^3.08';
metaData.bibkey.F1 = 'IqbaSuzu2009'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3FX2L'; % Cat of Life
metaData.links.id_ITIS = '645698'; % ITIS
metaData.links.id_EoL = '46580901'; % Ency of Life
metaData.links.id_Wiki = 'Gerres_equulus'; % Wikipedia
metaData.links.id_ADW = 'Gerres_equulus'; % ADW
metaData.links.id_Taxo = '174882'; % Taxonomicon
metaData.links.id_WoRMS = '276956'; % WoRMS
metaData.links.id_fishbase = 'Gerres-equulus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gerres_equulus}}';
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
bibkey = 'IqbaMasu2006'; type = 'Article'; bib = [ ... 
'author = {K. M. Iqbal and Y. Masuda and H. Suzuki and A. Shinomiya}, ' ... 
'year = {2006}, ' ...
'title = {Age and growth of the {J}apanese silver-biddy, \emph{Gerres equulus}, in western {K}yushu, {J}apan}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {77}, ' ...
'pages = {45-52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'IqbaSuzu2008'; type = 'Article'; bib = [ ... 
'author = {K. M. Iqbal and H. Suzuki and J. Ohtomi and Y. Masuda}, ' ... 
'year = {2008}, ' ...
'title = {Batch Fecundity of the {J}apanese Silver-biddy \emph{Gerres equulus} in the {Y}atsushiro {S}ea, Western {K}yushu, {J}apan}, ' ...
'journal = {Aquaculture Sci}, ' ...
'volume = {56}, ' ...
'pages = {409-413}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'IqbaSuzu2009'; type = 'Article'; bib = [ ... 
'author = {K. M. Iqbal and H. Suzuko}, ' ... 
'year = {2009}, ' ...
'title = {Length-weight relationships and condition factor of the {J}apanese silver-biddy, \emph{Gerres equulus}, in the {Y}atsushiro {S}ea, western {K}yushu, {J}apan}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {25}, ' ...
'pages = {219-222}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/59245}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

