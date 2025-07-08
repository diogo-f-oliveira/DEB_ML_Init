function [data, auxData, metaData, txtData, weights] = mydata_Okamejei_acutispina

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Okamejei_acutispina'; 
metaData.species_en = 'Sharpspine skate'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2019 01 08];                          
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
data.tp = 7.2*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females';         bibkey.tp = 'JouLee2011';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 6.8*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';         bibkey.tpm = 'JouLee2011';
  temp.tpm = C2K(25); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 13.3*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'JouLee2011';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 5.8;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'guess';
  comment.Lb = 'based on same relative length compared to Leucoraja erinacea: 9.7/54*32.4';
data.Li  = 32.4;  units.Li  = 'cm';  label.Li  = 'ultimate disk width for females';   bibkey.Li  = 'JouLee2011';
data.Lim  = 28.8;  units.Lim  = 'cm';  label.Lim  = 'ultimate disk width for males';   bibkey.Lim  = 'JouLee2011';

data.Wwi = 689; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'JouLee2011';
  comment.Wwi = 'besed on 0.0193*Li^3.014, see F1';
data.Wwim = 483; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'JouLee2011';
  comment.Wwim = 'besed on 0.0193*Lim^3.014, see F1';

data.Ri  = 16/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same weight-specific rate compared to Leucoraja erinacea 30*483/910/365';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), disc width (cm)
1.897	11.432
1.957	14.380
2.224	16.459
2.330	13.684
2.496	12.816
2.700	17.236
2.764	14.028
2.889	13.420
3.176	17.146
3.196	18.360
3.197	16.366
3.220	14.111
3.674	14.975
3.880	17.575
3.880	17.228
4.026	15.927
4.124	22.776
4.166	21.995
4.230	20.174
4.291	21.648
4.311	22.428
4.376	18.526
4.543	15.663
4.581	20.432
4.600	23.987
4.602	20.952
4.766	22.858
4.832	17.829
4.954	21.036
4.955	18.869
4.997	18.348
5.016	20.082
5.059	18.261
5.079	19.822
5.097	23.463
5.140	21.642
5.304	23.895
5.473	18.692
5.574	21.813
5.638	19.818
5.658	20.945
5.677	22.332
5.759	23.372
5.821	24.325
5.861	25.366
6.028	23.717
6.032	18.948
6.074	17.214
6.089	25.104
6.156	18.947
6.191	28.225
6.193	25.450
6.255	24.669
6.296	26.316
6.298	23.195
6.460	28.656
6.463	23.367
6.464	21.980
6.547	22.500
6.585	26.488
6.609	21.632
6.648	25.274
6.667	27.441
6.688	27.181
6.691	23.106
6.692	21.545
6.730	27.267
6.857	21.977
6.875	26.486
6.899	22.324
6.922	18.769
6.959	24.404
7.039	28.913
7.082	26.311
7.122	29.085
7.122	28.565
7.141	30.386
7.166	25.357
7.185	27.178
7.245	30.992
7.266	29.605
7.268	26.917
7.268	26.657
7.288	27.524
7.330	27.697
7.390	29.604
7.433	27.869
7.434	25.789
7.452	30.297
7.495	28.129
7.515	28.823
7.516	27.002
7.518	24.487
7.598	28.129
7.682	26.481
7.747	22.578
7.763	29.601
7.784	28.908
7.784	28.474
7.788	24.052
7.806	27.867
7.826	28.474
7.827	27.173
7.846	30.034
7.847	28.300
7.848	26.566
7.872	21.450
7.888	27.866
7.910	27.173
7.927	31.681
7.928	30.554
7.950	28.213
8.013	27.519
8.094	29.512
8.095	27.952
8.117	27.085
8.239	29.598
8.281	28.211
8.445	31.678
8.445	31.158
8.446	29.857
8.447	28.903
8.469	26.909
8.490	26.475
8.508	29.423
8.509	29.076
8.509	28.903
8.550	29.770
8.551	27.602
8.552	26.475
8.881	28.900
8.882	28.640
8.900	31.501
8.902	29.247
8.965	28.206
8.965	28.033
9.005	30.113
9.005	29.593
9.005	29.073
9.089	28.639
9.089	28.292
9.108	30.633
9.191	29.939
9.295	29.504
9.419	29.677
9.420	27.856
9.503	27.335
9.667	29.675
9.668	29.242
9.709	28.721
9.793	27.680
9.833	29.154
9.835	26.900
9.916	28.980
10.000	28.199
10.516	29.236
10.600	28.282
10.722	30.796
11.655	28.969];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
temp.tL_f = C2K(25); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JouLee2011';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
1.762	13.765
1.866	12.265
1.907	13.941
2.094	15.000
2.239	13.588
2.260	14.559
2.550	16.235
2.758	13.588
2.758	13.412
2.986	13.059
3.069	13.853
3.152	16.588
3.214	16.676
3.297	15.706
3.338	16.235
3.380	17.029
3.400	18.706
3.587	17.206
3.587	15.971
3.898	15.882
3.898	13.765
4.022	17.824
4.085	21.618
4.271	22.059
4.437	20.029
4.603	21.176
4.748	21.265
4.914	16.412
4.935	20.647
5.038	17.294
5.100	23.559
5.204	21.176
5.225	20.471
5.308	20.382
5.308	21.176
5.432	20.471
5.536	21.706
5.577	24.441
5.577	22.147
5.577	20.647
5.785	19.500
5.888	18.794
5.909	21.618
6.075	21.971
6.116	22.941
6.158	21.971
6.179	19.765
6.262	22.588
6.262	24.353
6.282	20.206
6.324	24.882
6.469	26.029
6.469	25.324
6.490	22.412
6.490	21.353
6.531	22.147
6.531	24.353
6.531	25.059
6.552	25.765
6.573	20.824
6.573	23.294
6.573	24.000
6.676	24.000
6.697	23.294
6.759	25.147
6.801	25.941
6.821	25.059
6.884	22.765
6.925	21.882
6.946	23.206
6.946	21.529
6.967	25.676
7.070	25.412
7.070	25.853
7.070	26.206
7.153	25.588
7.174	23.647
7.195	22.059
7.215	24.176
7.215	24.353
7.236	26.471
7.257	24.882
7.278	25.147
7.278	25.588
7.319	23.559
7.319	27.706
7.360	26.735
7.485	25.941
7.485	25.412
7.485	23.912
7.485	22.941
7.526	24.176
7.568	25.235
7.568	23.118
7.609	22.235
7.651	24.353
7.713	25.324
7.775	23.294
7.775	23.912
7.941	24.176
7.941	27.529
7.962	25.412
7.962	25.765
8.045	26.471
8.086	23.294
8.107	24.353
8.107	26.118
8.148	25.059
8.148	25.853
8.190	26.118
8.231	24.529
8.252	26.118
8.252	27.882
8.356	24.618
8.397	27.176
8.397	25.676
8.418	25.059
8.522	25.941
8.604	24.529
8.604	25.500
8.646	24.353
8.708	26.118
8.812	25.500
8.957	26.471
9.144	27.529
9.206	26.294
9.226	26.647
9.289	25.059
9.413	25.324
9.475	25.147
9.558	26.471
9.641	25.853
9.662	26.559
9.724	28.588
9.786	27.794
9.890	27.794
9.952	28.765];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(25); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JouLee2011';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 8 * weights.psd.p_M;

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
D1 = 'males are assumed to differ from females by {p_Am} anf E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.0193(disk width in cm)^3.014';
metaData.bibkey.F1 = 'JouLee2011'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74JB4'; % Cat of Life
metaData.links.id_ITIS = '564191'; % ITIS
metaData.links.id_EoL = '46560613'; % Ency of Life
metaData.links.id_Wiki = 'Okamejei'; % Wikipedia
metaData.links.id_ADW = 'Okamejei_acutispina'; % ADW
metaData.links.id_Taxo = '181706'; % Taxonomicon
metaData.links.id_WoRMS = '279178'; % WoRMS
metaData.links.id_fishbase = 'Okamejei-acutispina'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Okamejei}}'; 
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
bibkey = 'JouLee2011'; type = 'Article'; bib = [ ... 
'author = {Shoou-Jeng Joung and Pei-Hsuan Lee and Kwang-Ming Liu and Yih-Yia Liao}, ' ...
'year = {2011}, ' ...
'title  = {Estimates of life history parameters of the sharpspine skate, \emph{Okamejei acutispina}, in the northeastern waters of {T}aiwan}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {108}, ' ...
'pages = {258-267}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Okamejei-acutispina.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

