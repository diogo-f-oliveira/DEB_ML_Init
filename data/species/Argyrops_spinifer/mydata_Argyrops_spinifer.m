function [data, auxData, metaData, txtData, weights] = mydata_Argyrops_spinifer

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Argyrops_spinifer'; 
metaData.species_en = 'King soldierbream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'WWp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 04];

%% set data
% zero-variate data

data.am = 22*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'GranAbde2004';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30.9;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 80;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 506; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01549*Lp^3.03, see F1';
data.Wwi = 9e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01549*Li^3.03, see F1';

data.Ri  = 1.24e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

 % univariate data
 % time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.403	14.634
0.417	15.732
0.472	14.390
0.514	15.854
0.527	14.146
0.583	16.463
0.624	15.122
0.680	16.951
0.693	15.488
0.707	14.512
0.708	17.927
0.749	16.341
0.763	17.561
0.764	21.220
0.832	19.878
0.846	18.171
0.847	19.024
0.914	16.829
0.928	15.244
0.997	15.366
1.024	16.585
1.080	18.659
1.081	19.634
1.082	20.976
1.149	19.756
1.163	17.927
1.218	17.317
1.232	19.878
1.246	19.146
1.247	21.585
1.248	22.073
1.249	23.293
1.259	18.780
1.274	20.366
1.275	22.561
1.314	14.634
1.315	15.976
1.342	17.927
1.357	24.024
1.425	16.951
1.426	17.561
1.439	20.854
1.465	14.634
1.467	22.439
1.480	15.976
1.481	22.317
1.508	20.244
1.535	16.707
1.562	15.122
1.564	22.317
1.578	24.512
1.618	20.976
1.619	23.415
1.633	25.488
1.647	22.683
1.674	20.732
1.688	23.415
1.756	23.415
1.757	24.756
1.758	25.976
1.759	26.707
1.812	22.561
1.813	27.073
1.826	21.220
1.827	26.341
1.840	24.268
1.841	28.659
1.853	22.317
1.869	28.171
1.921	16.341
1.922	17.561
1.934	15.122
1.978	25.610
2.020	27.561
2.034	25.976
2.061	26.341
2.117	27.561
2.142	18.780
2.170	19.268
2.173	31.098
2.186	29.268
2.201	33.537
2.214	30.000
2.226	22.683
2.239	21.341
2.254	26.220
2.255	28.049
2.270	33.537
2.280	18.415
2.324	29.756
2.405	20.854
2.406	21.951
2.433	24.878
2.501	21.707
2.502	24.146
2.503	24.878
2.515	19.024
2.517	28.780
2.530	26.341
2.556	21.707
2.557	22.195
2.558	28.537
2.569	16.220
2.585	22.927
2.613	26.341
2.656	34.024
2.670	33.659
2.694	20.732
2.709	25.244
2.750	24.268
2.751	26.220
2.780	34.390
2.793	29.024
2.794	32.683
2.807	30.488
2.848	27.439
2.849	29.634
2.902	24.878
2.903	25.366
2.904	25.976
2.916	30.244
2.917	30.976
2.918	33.293
2.930	26.341
2.945	31.951
2.957	23.537
2.972	28.049
2.987	33.537
3.000	31.585
3.002	38.780
3.016	37.805
3.027	27.195
3.041	29.024
3.123	26.707
3.166	30.488
3.167	32.073
3.223	39.634
3.237	40.854
3.247	25.122
3.248	31.341
3.249	33.537
3.263	32.805
3.304	33.780
3.346	37.195
3.357	24.634
3.373	32.683
3.384	22.195
3.509	22.439
3.564	23.902
3.577	21.951
3.592	23.537
3.662	30.854
3.663	34.268
3.690	32.073
3.745	30.122
3.758	28.902
3.869	30.610
3.926	36.707
3.967	37.195
3.969	47.317
3.997	45.610
4.021	35.000
4.022	36.098
4.023	40.610
4.075	25.366
4.091	37.683
4.103	30.244
4.105	38.293
4.133	38.659
4.148	41.829
4.217	43.780
4.226	21.707
4.241	27.317
4.254	26.098
4.255	31.341
4.271	39.024
4.283	29.146
4.309	23.659
4.323	25.610
4.434	27.561
4.448	29.878
4.491	35.854
4.502	25.610
4.517	27.561
4.530	26.341
4.587	33.659
4.710	30.732
4.990	47.439
5.003	44.390
5.157	54.024
5.224	43.293
5.249	33.415
5.250	36.220
5.275	27.439
5.278	39.512
5.292	41.951
5.316	24.756
5.372	26.341
5.414	30.488
5.415	33.659
5.469	29.634
5.664	38.171
6.024	45.488
6.025	49.756
6.080	47.805
6.093	46.341
6.160	37.073
6.165	55.854
6.342	48.902
7.018	50.366
7.019	52.195
7.212	51.463
7.225	49.268
7.307	44.390
7.432	48.537
9.089	58.902];    
data.tL(:,1) = 365 * (data.tL(:,1) + 0.75);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL   = C2K(27.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GranAbde2004';

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
F1 = 'length-weight: Ww in g = 0.02291*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'GKHB'; % Cat of Life
metaData.links.id_ITIS = '647918'; % ITIS
metaData.links.id_EoL = '46580055'; % Ency of Life
metaData.links.id_Wiki = 'Argyrops_spinifer'; % Wikipedia
metaData.links.id_ADW = 'Argyrops_spinifer'; % ADW
metaData.links.id_Taxo = '161630'; % Taxonomicon
metaData.links.id_WoRMS = '218590'; % WoRMS
metaData.links.id_fishbase = 'Argyrops_spinifer'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Argyrops_spinifer}}';
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
bibkey = 'GranAbde2004'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.fishres.2004.04.006}, ' ...
'author = {E.M. Grandcourt and T.Z. Al Abdessalaam and F. Francis and A.T. Al Shamsi}, ' ... 
'year = {2004}, ' ...
'title = {Biology and stock assessment of the Sparids, \emph{Acanthopagrus bifasciatus} and \emph{Argyrops spinifer} ({F}orsskal, 1775), in the {S}outhern {A}rabian {G}ulf}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {69}, ' ...
'pages = {7–20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Argyrops-spinifer.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
