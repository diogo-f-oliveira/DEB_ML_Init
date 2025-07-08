  function [data, auxData, metaData, txtData, weights] = mydata_Salvelinus_namaycush

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salvelinus_namaycush'; 
metaData.species_en = 'Lake trout'; 

metaData.ecoCode.climate = {'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 13]; 

%% set data
% zero-variate data
data.am = 50*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 46;     units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
  comment.Lp = '42 to 50 cm';
data.Li = 150;    units.Li = 'cm';  label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 8.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at hatch';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwi = 32.7e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.Ri = 17e3/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate';   bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL_L = [... % time since birth (yr), fork length (cm)
6.005	35.016
6.046	37.160
6.066	38.547
7.008	36.269
7.009	38.665
7.069	39.548
8.010	35.126
8.010	36.135
8.011	37.649
8.011	38.531
9.013	36.001
9.013	37.010
9.014	40.037
10.035	35.993
10.037	41.543
10.979	41.031
10.999	40.148
11.018	37.373
11.039	39.390
12.001	38.878
12.002	40.266
12.002	41.275
12.022	42.914
12.984	38.997
14.007	39.998
14.008	45.421
15.029	40.999
15.030	43.395];
data.tL_L(:,1) = 365 * data.tL_L(:,1); % convert yr to d
units.tL_L = {'d', 'cm'};     label.tL_L = {'time since birth', 'fork length', 'Louisa Lake'};  
temp.tL_L = C2K(10); units.temp.tL_L = 'K'; label.temp.tL_L = 'temperature';
bibkey.tL_L = {'MorbCout2010'};
comment.tL_L = 'Data for Louisa Lake';
%
data.tL_O = [... % time since birth (yr), fork length (cm)
3.017	31.886
3.018	37.562
3.020	42.607
3.055	27.219
4.002	40.077
4.020	34.275
4.020	35.284
4.021	36.545
4.021	37.554
5.003	35.907
5.004	39.564
5.004	41.204
5.005	42.717
5.005	44.105
5.023	37.546
5.986	39.178
5.987	40.187
5.987	41.070
5.988	44.980
6.008	45.610
6.025	33.628
6.025	36.025
6.027	42.457
6.029	48.637
6.048	43.592
6.049	47.250
6.090	51.285
6.992	49.134
6.992	50.395
6.992	52.287
7.009	41.188
7.010	43.332
7.010	43.963
7.012	49.891
7.994	49.126
7.994	50.135
8.013	44.081
8.015	53.036
8.033	45.847
8.036	54.423
8.997	50.127
9.016	45.460
9.018	52.902
9.980	53.399
10.001	55.038
10.038	44.065
12.064	49.220];
data.tL_O(:,1) = 365 * data.tL_O(:,1); % convert yr to d
units.tL_O = {'d', 'cm'};     label.tL_O = {'time since birth', 'fork length', 'Opeongo Lake'};  
temp.tL_O = C2K(10); units.temp.tL_O = 'K'; label.temp.tL_O = 'temperature';
bibkey.tL_O = {'MorbCout2010'};
comment.tL_O = 'Data for Opeongo Lake';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_L = 5 * weights.tL_L;
weights.tL_O = 5 * weights.tL_O;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_L', 'tL_O'}; subtitle1 = {'Data for Louisa, Opeongo Lake'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'temperatures are guessed; 10 C is the preferred temperature';
metaData.discussion = struct('D1', D1);
                                 
%% Links
metaData.links.id_CoL = '6XFR8'; % Cat of Life
metaData.links.id_ITIS = '162002'; % ITIS
metaData.links.id_EoL = '205277'; % Ency of Life
metaData.links.id_Wiki = 'Salvelinus_namaycush'; % Wikipedia
metaData.links.id_ADW = 'Salvelinus_namaycush'; % ADW
metaData.links.id_Taxo = '42837'; % Taxonomicon
metaData.links.id_WoRMS = '567548'; % WoRMS
metaData.links.id_fishbase = 'Salvelinus-namaycush'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Salvelinus_namaycush}}';  
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
bibkey = 'MorbCout2010'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.2010.02804.x}, ' ...
'author = {Y. E. Morbey and P. Couture and P. Busby and B. J. Shuter}, ' ...
'year = {2010}, ' ...
'title = {Physiological correlates of seasonal growth patterns in lake trout \emph{Salvelinus namaycush}}, ' ... 
'journal = {J. Fish Biol.}, ' ...
'volume = {77}, '...
'pages = {2298-2314}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Salvelinus-namaycush.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
