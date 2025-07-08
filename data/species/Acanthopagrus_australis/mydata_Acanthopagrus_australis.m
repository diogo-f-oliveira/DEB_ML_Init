function [data, auxData, metaData, txtData, weights] = mydata_Acanthopagrus_australis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Acanthopagrus_australis'; 
metaData.species_en = 'Yellowfin seabream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 09 24];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 24];

%% set data
% zero-variate data

data.ab = 2.5+3;  units.ab = 'd';   label.ab = 'age at birth';             bibkey.ab = 'fishbase';   
  temp.ab = C2K(24.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch after 2.5 d, assumed 3 d more till first feeding';
data.am = 14*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'HoylBrow2000';   
  temp.am = C2K(24.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 24;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 66;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum: pi/6*0.075^3';
data.Wwi = 4300; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^3.04, see F1';

data.Ri = 3e6/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(24.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.263	8.296
0.264	8.988
0.265	10.173
0.278	5.333
0.316	9.679
0.329	4.938
0.519	7.605
0.538	10.173
0.553	8.000
0.830	11.457
0.948	10.667
1.000	11.358
1.003	14.321
1.227	16.889
1.238	9.778
1.239	10.864
1.257	11.951
1.258	13.037
1.272	9.383
1.273	10.370
1.274	11.358
1.289	9.284
1.296	17.975
1.305	8.395
1.309	13.432
1.344	13.926
1.562	9.778
1.571	19.457
1.619	15.802
1.724	18.864
1.824	15.901
1.825	16.593
1.993	14.519
2.207	24.395
2.218	17.580
2.251	16.790
2.254	19.457
2.270	18.272
2.285	15.901
2.289	21.235
2.305	19.062
2.355	18.469
2.374	20.444
2.456	16.691
2.492	19.160
2.493	20.247
2.544	19.556
2.562	20.642
2.580	21.926
2.662	17.679
2.716	21.531
2.766	19.358
2.818	19.951
2.837	22.519
2.850	17.679
2.937	20.148
2.968	16.395
2.969	17.284
3.009	24.000
3.011	26.370
3.126	21.037
3.127	21.630
3.128	24.000
3.191	17.679
3.211	20.840
3.213	23.210
3.214	24.395
3.243	19.160
3.244	19.951
3.245	20.543
3.246	21.136
3.247	22.420
3.260	17.877
3.276	17.284
3.278	17.481
3.280	21.630
3.312	18.568
3.381	19.654
3.419	24.395
3.434	22.420
3.465	18.370
3.468	22.222
3.485	21.333
3.553	21.926
3.554	22.617
3.555	23.407
3.568	18.864
3.569	20.444
3.639	22.025
3.657	23.407
3.706	20.642
3.708	24.198
3.709	24.494
3.739	19.753
3.742	22.321
3.759	22.815
3.792	20.741
3.807	18.963
3.828	23.901
3.859	19.753
4.016	23.704
4.018	26.074
4.118	23.012
4.135	23.309
4.154	25.284
4.170	23.901
4.204	23.407
4.209	30.025
4.215	16.198
4.221	24.198
4.222	24.790
4.238	23.407
4.240	25.679
4.252	20.148
4.254	22.617
4.267	17.383
4.268	18.469
4.269	19.654
4.287	21.235
4.302	18.864
4.305	21.630
4.306	23.012
4.322	22.617
4.360	26.469
4.409	23.407
4.425	22.716
4.444	25.284
4.491	19.852
4.494	23.210
4.512	24.691
4.542	19.259
4.547	25.778
4.559	20.049
4.560	21.235
4.579	23.210
4.598	24.889
4.660	18.272
4.751	24.000
4.781	19.160
4.798	20.049
4.923	26.074
4.972	23.704
4.974	25.284
4.992	26.765
5.042	25.679
5.077	25.877
5.110	25.383
5.146	27.654
5.184	31.407
5.194	22.815
5.214	27.259
5.226	20.741
5.227	21.136
5.228	21.432
5.229	24.198
5.230	24.790
5.241	18.864
5.242	19.358
5.245	23.210
5.275	18.370
5.276	19.654
5.292	18.173
5.297	24.198
5.384	25.778
5.398	21.728
5.468	24.691
5.482	21.136
5.485	23.901
5.487	26.074
5.519	24.296
5.603	22.420
5.608	27.951
5.672	23.704
5.761	27.062
5.946	24.494
6.101	25.481
6.102	27.358
6.152	25.877
6.180	18.667
6.199	21.037
6.205	27.358
6.216	20.346
6.217	22.025
6.221	26.370
6.223	28.642
6.232	19.654
6.253	24.099
6.273	26.765
6.319	21.531
6.339	24.790
6.510	24.198
6.530	27.852
6.597	26.864
6.714	24.000
6.786	27.556
6.799	23.309
6.802	26.765
6.903	24.593
6.992	29.728
7.128	28.938
7.224	20.938
7.241	20.642
7.773	23.506
7.809	26.667
7.810	27.358
7.862	28.049
8.197	21.136
8.972	28.444
9.002	23.901
9.021	25.284
9.061	33.086
9.427	21.728
9.433	28.444
9.440	36.840
9.808	26.963
9.876	26.667
9.891	24.988
9.911	28.642
9.928	28.346
9.949	32.395
9.974	22.519
9.976	24.000
9.979	28.148
9.990	20.543
9.993	24.593
10.033	31.506
10.064	26.963
10.103	33.580
10.899	24.790
10.901	28.247
10.951	25.877
11.073	29.531
11.777	33.481
11.811	33.383
11.941	25.383
11.942	26.074
12.064	29.531
12.988	31.704
13.037	29.333
13.365	33.383
13.859	32.691];
data.tL(:,1) = 365 * (0.3+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};   label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(24.7); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'HoylBrow2000'};

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

%% Facts
F1 = 'length-weight: Ww in g =  0.01259*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Protandrous hermaphrodite; Sex change (from male to female) at 19.1 cm total length, 1.95 yr';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '64GH7'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46580064'; % Ency of Life
metaData.links.id_Wiki = 'Acanthopagrus_australis'; % Wikipedia
metaData.links.id_ADW = 'Acanthopagrus_australis'; % ADW
metaData.links.id_Taxo = '159909'; % Taxonomicon
metaData.links.id_WoRMS = '279070'; % WoRMS
metaData.links.id_fishbase = 'Acanthopagrus-australis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthopagrus_australis}}';
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
bibkey = 'HoylBrow2000'; type = 'techreport'; bib = [ ... 
'author = {Hoyle, S. and I. Brown and C. Dichmont and M. Sellin and M. Cosgrove and M. McLennan}, ' ... 
'year = {2000}, ' ...
'title = {Integrated fish stock assessment and monitoring program}, ' ...
'institution = {Fisheries Research and Development Corporation}, ' ...
'volume = {Project 94/161}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Acanthopagrus-australis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

