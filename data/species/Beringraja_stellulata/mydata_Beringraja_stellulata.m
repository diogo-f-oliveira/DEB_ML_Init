function [data, auxData, metaData, txtData, weights] = mydata_Beringraja_stellulata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Beringraja_stellulata'; 
metaData.species_en = 'Starry skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 09];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 09]; 

%% set data
% zero-variate data;
data.ab = 9.5*30.5;units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(8.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365; units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(8.9);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 12;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';
data.Lp  = 47;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'Wiki';
data.Lpm  = 46;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'Wiki';
data.Li  = 86.1;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Jame2011';
 
data.Wwi = 3.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00282 *Li^3.24, see F1';

data.Ri  = 65/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Jame2011';   
  temp.Ri = C2K(8.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'speculative, based on related species of the same size';

% uni-variate data at f
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.517	14.852
1.014	27.342
1.397	27.511
1.512	24.135
1.531	32.405
1.742	29.536
1.780	25.148
2.431	28.861
2.526	26.160
2.545	28.861
2.756	29.705
3.158	42.194
3.273	43.544
3.751	41.181
3.789	41.519
4.000	42.194
4.096	51.646
4.191	46.245
4.268	52.152
4.306	48.608
4.536	39.494
4.727	49.789
4.938	62.954
5.053	50.970
5.263	48.101
5.282	58.734
5.321	50.970
5.531	41.013
5.589	73.755
5.722	47.426
5.856	50.802
5.856	49.789
5.856	45.401
5.895	52.321
6.124	65.148
6.182	50.295
6.220	48.945
6.239	69.030
6.316	58.734
6.488	59.241
6.488	60.759
6.507	46.245
6.507	63.291
6.526	44.895
6.660	64.979
6.813	50.464
6.813	49.451
6.947	47.089
7.100	69.367
7.100	57.384
7.120	67.173
7.139	65.485
7.158	51.983
7.215	68.017
7.407	69.367
7.694	62.785
7.694	44.388
7.885	65.654
7.904	57.046
8.038	66.667
8.096	57.384
8.096	56.034
8.172	70.211
8.268	62.616
8.268	68.186
8.459	62.616
8.478	65.654
8.574	64.304
8.574	63.122
8.861	66.160
9.072	65.823
9.072	63.460
9.225	74.430
9.589	68.692
9.703	75.612
9.703	60.084
9.742	58.565
9.761	63.291
10.278	73.080
10.679	76.456
10.737	66.835
10.909	69.536
11.215	70.211
11.598	73.418];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(8.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'JameEber2013';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.555	21.941
1.033	32.236
1.397	22.785
1.493	28.186
1.493	25.823
1.493	20.253
1.531	32.911
1.665	27.173
2.488	36.962
2.756	32.236
3.043	33.249
3.081	48.101
3.675	34.768
3.694	32.068
3.751	36.118
3.751	26.667
3.943	61.603
4.000	31.392
4.057	47.089
4.134	47.426
4.153	49.114
4.536	56.709
4.555	36.624
4.727	42.025
4.766	45.401
4.861	43.882
4.957	58.565
4.957	54.852
4.957	41.519
5.033	50.295
5.206	48.945
5.282	50.127
5.340	54.684
5.474	43.376
5.589	54.177
5.608	48.439
5.684	50.295
5.761	44.219
5.818	48.439
5.837	51.308
5.856	58.734
5.914	53.840
5.952	54.852
6.010	62.954
6.067	57.215
6.067	62.954
6.067	66.498
6.067	68.354
6.067	54.008
6.105	59.578
6.163	51.814
6.431	59.578
6.737	45.738
6.756	59.241
6.794	51.477
7.081	67.511
7.100	61.435
7.120	70.211
7.234	67.342
7.234	49.958
7.254	52.996
7.292	72.236
7.483	66.498
7.522	46.245
7.541	59.747
7.560	71.055
7.617	69.536
7.732	54.515
7.770	65.654
7.828	55.527
7.904	68.354
7.962	60.928
8.057	65.148
8.077	63.122
8.077	67.342
8.211	66.160
8.230	69.873
8.249	60.759
8.498	58.228
8.727	63.460
8.804	57.046
8.900	67.679
8.919	65.148
9.091	70.717
9.722	62.785
9.876	66.498
10.124	66.329];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(8.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'JameEber2013';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;

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
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length - weight: Ww in g = 0.00282  * (TL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6WRCF'; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '160854'; % ITIS
metaData.links.id_EoL = '59030933'; % Ency of Life
metaData.links.id_Wiki = 'Beringraja_stellulata'; % Wikipedia
metaData.links.id_ADW = 'Raja_stellulata'; % ADW
metaData.links.id_Taxo = '185731'; % Taxonomicon
metaData.links.id_WoRMS = '1461135'; % WoRMS
metaData.links.id_fishbase = 'Beringraja-stellulata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Beringraja_stellulata}}';   
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
bibkey = 'JameEber2013'; type = 'article'; bib = [ ...  
'doi = {10.1007/s10641-013-0164-0}, ' ...
'author = {Kelsey C. James and David A. Ebert and Lisa J. Natanson and Gregor M. Cailliet}, ' ...
'year = {2013}, ' ...
'title  = {Age and growth characteristics of the Starry Skate, \emph{Raja stellulata}, with a description of life history and habitat trends of the central {C}alifornia, {U}.{S}.{A}., skate assemblage}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {51(2)}, ' ...
'pages = {227?234}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jame2011'; type = 'phdthesis'; bib = [ ...  
'author = {Kelsey C. James}, ' ...
'year = {2011}, ' ...
'title  = {Life history charactersitics of the starry skate \emph{Raja stellulata} from {C}alifornia waters}, ' ...
'school = {San Jos\''{e} State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Beringraja-stellulata.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];