function [data, auxData, metaData, txtData, weights] = mydata_Canis_lupus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Canidae';
metaData.species    = 'Canis_lupus'; 
metaData.species_en = 'Wolf'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TPi'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvm', 'xiSvm', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx';  'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm   = [2016 12 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 62;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 47;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 669;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20.6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 450;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 5250;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 40000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'MacNSmit2009';
  comment.Wwi = 'Wiki: 36 till 38.5 kg';
data.Wwim = 56000;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'MacNSmit2009';
  comment.Wwim = 'Wiki: 43 till 45 kg';
  
data.Ri  = 0.8*6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'AnAge'};   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 pups per litter, 0.8 litters per yr';
  
% uni-variate data
% time-weight
data.tW_f = [ % time since birth (yr), carcass weight (kg)
0.028	0.994
0.071	1.864
0.129	2.238
0.210	7.452
0.243	17.878
0.290	15.025
0.330	18.377
0.342	20.363
0.355	21.852
0.359	18.377
0.393	13.537
0.400	20.364
0.405	15.772
0.468	25.578
0.468	25.082
0.469	24.337
0.476	18.007
0.478	29.674
0.483	38.734
0.496	26.323
0.515	35.880
0.522	14.781
0.543	23.097
0.548	31.785
0.565	29.427
0.568	26.821
0.600	38.488
0.616	36.503
0.621	31.911
0.622	31.042
0.640	41.592
0.655	40.848
0.668	42.710
0.673	37.249
0.676	35.263
0.678	33.153
0.679	31.788
0.681	44.323
0.694	45.441
0.701	38.987
0.702	37.870
0.706	34.023
0.714	40.353
0.718	50.158
0.720	48.172
0.722	32.906
0.733	36.257
0.734	35.140
0.738	31.293
0.743	25.832
0.752	45.194
0.756	27.942
0.768	29.804
0.782	44.574
0.784	43.209
0.785	41.719
0.789	38.368
0.790	37.127
0.791	36.134
0.824	32.412
0.829	41.596
0.829	26.951
0.830	40.107
0.833	37.749
0.837	47.430
0.842	42.713
0.844	40.852
0.850	35.391
0.851	34.150
0.854	31.171
0.882	32.040
0.884	30.799
0.899	44.080
0.899	29.434
0.919	38.371
0.938	34.152
1.025	34.153
1.078	38.995
1.103	43.215
1.192	27.951
1.304	31.677
1.489	35.280
1.493	31.805
1.512	41.238
1.517	36.522
1.541	41.238
1.544	38.012
1.568	43.349
1.657	41.737
1.726	45.338
1.731	40.001
1.736	35.285
1.740	31.810
1.746	39.257
1.756	44.222
1.757	43.477
1.764	35.906
1.774	41.119
1.776	38.637
1.793	50.552
1.793	36.403
1.802	41.244
1.832	41.244
1.851	36.404
1.896	35.288
1.912	33.675
1.923	37.523
2.033	29.458
2.186	35.418
2.238	41.253
2.527	43.121
2.532	38.280
2.561	38.777
2.676	39.648
2.704	40.394
2.712	46.848
2.714	44.614
2.715	43.497
2.718	41.263
2.753	35.182
2.763	40.023
2.765	37.292
2.767	50.076
2.798	48.215
2.824	37.045
2.873	45.362
2.946	45.736
2.992	43.254
3.005	30.099
3.170	39.907
3.300	40.282
3.391	36.312
3.423	33.831
3.711	49.847
3.739	51.089
3.745	45.256
3.777	42.154
4.323	34.222
4.676	43.910
4.681	39.318
4.734	44.656
4.805	31.997
4.952	44.040
5.018	50.247
5.059	38.705
5.081	45.532
5.713	52.371
5.757	38.347
5.805	34.128
5.823	45.175
6.137	36.121
6.701	52.515
6.769	43.332
6.770	42.340
6.771	41.098
6.773	39.733
6.808	47.305
7.552	44.714
7.740	45.711
7.878	52.788
8.057	33.802]; 
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert yr to d
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'total weight', 'female'};  
temp.tW_f  = C2K(38.3);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'MacNSmit2009';
comment.tW_f = 'Data for females in Yellowstone National Park, US';
% 
data.tW_m = [ ... % time since birth (yr), wet weight (kg)
0.014	2.230
0.029	0.248
0.057	5.699
0.057	4.460
0.130	1.487
0.158	6.195
0.159	4.956
0.201	12.885
0.216	7.434
0.302	16.602
0.304	4.708
0.331	15.611
0.331	15.239
0.346	12.513
0.373	22.549
0.402	21.929
0.403	19.080
0.403	17.841
0.417	21.062
0.445	26.637
0.459	29.115
0.473	32.584
0.474	24.655
0.502	30.973
0.544	40.142
0.545	36.053
0.548	17.717
0.575	28.000
0.587	41.876
0.587	39.398
0.588	35.434
0.601	45.345
0.620	22.796
0.631	40.637
0.646	34.938
0.673	44.850
0.674	41.876
0.675	36.425
0.677	29.735
0.688	43.115
0.689	38.407
0.717	46.956
0.733	39.150
0.733	37.540
0.744	53.274
0.746	45.965
0.759	54.637
0.761	43.239
0.761	41.876
0.762	40.142
0.775	47.823
0.775	44.478
0.788	53.770
0.790	41.257
0.792	34.938
0.792	33.451
0.803	49.929
0.803	49.310
0.806	38.035
0.817	51.292
0.817	50.796
0.833	45.097
0.850	36.177
0.860	54.513
0.863	39.150
0.864	38.655
0.892	43.363
0.893	36.301
0.919	52.283
0.920	44.478
0.935	45.965
0.965	37.664
0.979	43.115
1.093	54.265
1.123	50.796
1.168	42.743
1.214	31.469
1.415	40.142
1.501	45.345
1.502	41.876
1.516	42.991
1.517	39.274
1.560	44.850
1.589	44.354
1.617	49.805
1.661	47.823
1.705	45.345
1.706	42.000
1.717	54.389
1.718	49.805
1.736	34.938
1.737	32.460
1.748	47.451
1.761	56.743
1.763	45.345
1.764	42.496
1.778	43.363
1.779	38.407
1.793	40.761
1.805	54.265
1.806	48.071
1.806	46.832
1.823	36.673
1.833	58.726
1.837	38.035
1.837	37.664
1.849	51.912
1.849	49.805
1.879	45.221
1.894	43.858
1.909	39.770
1.968	37.664
1.982	40.637
2.039	42.867
2.082	48.938
2.109	56.619
2.229	38.407
2.446	42.743
2.458	53.894
2.475	45.469
2.533	44.973
2.588	58.973
2.591	47.823
2.661	56.619
2.664	42.991
2.719	59.097
2.720	54.389
2.721	49.805
2.752	41.876
2.779	47.451
2.780	45.841
2.791	61.080
2.823	49.805
2.824	42.124
2.824	40.513
2.835	57.982
2.836	54.142
2.839	38.531
2.853	43.115
2.910	47.575
3.013	42.867
3.332	43.363
3.447	53.274
3.478	43.982
3.650	53.894
3.693	53.894
3.735	61.327
3.736	56.619
3.738	49.805
3.751	55.009
3.766	53.398
3.779	59.717
3.782	45.841
3.823	57.239
3.826	45.965
3.840	47.575
3.913	44.602
4.709	59.097
4.710	56.372
4.712	47.575
4.753	59.841
4.754	55.381
4.797	56.248
4.797	54.637
4.798	51.912
4.826	55.752
4.897	63.805
5.366	46.956
5.729	44.354
5.771	53.770
5.786	49.681
5.816	47.327
6.092	47.451
6.554	58.726
6.745	52.159
6.775	45.097
6.817	53.522
7.096	40.513
7.193	60.956
8.777	56.991
9.752	51.168
11.338	40.637]; 
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
n=size(data.tW_m,1); for i=2:n; if data.tW_m(i,1)<=data.tW_m(i-1,1); data.tW_m(i,1)=data.tW_m(i-1,1)+1e-3; end; end
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'total weight', 'male'};  
temp.tW_m  = C2K(38.3);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'MacNSmit2009';
comment.tW_m = 'Data for males in Yellowstone National Park, US';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 5 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; weights.psd.t_0 = 1; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'QLXL'; % Cat of Life
metaData.links.id_ITIS = '180596'; % ITIS
metaData.links.id_EoL = '328607'; % Ency of Life
metaData.links.id_Wiki = 'Canis_lupus'; % Wikipedia
metaData.links.id_ADW = 'Canis_lupus'; % ADW
metaData.links.id_Taxo = '66415'; % Taxonomicon
metaData.links.id_WoRMS = '1506689'; % WoRMS
metaData.links.id_MSW3 = '14000738'; % MSW3
metaData.links.id_AnAge = 'Canis_lupus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Canis_lupus}}';
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
bibkey = 'MacNSmit2009'; type = 'Article'; bib = [ ... 
'author = {D. R. MacNulty and D. W. Smith and L. D. Mech and L. E. Eberly}, ' ... 
'year = {2009}, ' ...
'title = {Body size and predatory performance in wolves: is bigger better?}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {78}, ' ...
'pages = {532-539}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Canis_lupus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

