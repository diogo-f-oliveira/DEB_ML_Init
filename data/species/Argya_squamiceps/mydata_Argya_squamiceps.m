function [data, auxData, metaData, txtData, weights] = mydata_Argya_squamiceps
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Leiothrichidae';
metaData.species    = 'Argya_squamiceps'; 
metaData.species_en = 'Arabian babbler'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTd'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biC'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 14;       units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 12;       units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'AnavKam2001';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 36;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;      units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 13.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnavKam2001';
data.Wwi = 73.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 64 to 83 g';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weights
data.tW = [ ... % time since birth (d), weight^1/3 in g^1/3
1.001	3.529
1.002	4.256
1.002	4.671
1.002	5.087
1.025	5.709
1.910	7.163
1.911	10.069
1.911	10.900
1.934	8.824
1.934	9.343
1.956	7.682
1.979	5.709
1.980	8.201
2.002	4.360
2.002	4.983
2.002	5.398
2.002	6.228
2.028	11.730
2.979	6.644
2.980	7.578
2.980	8.824
2.980	9.239
2.981	11.730
2.981	12.249
2.982	12.976
2.982	13.391
3.004	9.758
3.004	10.173
3.004	10.484
3.004	10.900
3.004	11.315
3.005	14.014
3.957	8.304
3.957	10.069
3.959	13.495
3.959	13.910
3.959	14.740
3.959	15.260
3.960	15.675
3.960	15.882
3.960	16.298
3.960	16.920
3.960	17.958
3.961	19.619
3.961	20.035
3.961	20.657
3.962	23.253
3.981	11.003
3.981	12.353
3.985	22.630
4.007	18.789
4.941	26.782
4.960	16.609
4.962	22.215
4.962	22.837
4.963	23.356
4.986	24.291
4.986	25.121
4.987	25.848
5.006	15.882
5.029	14.740
5.030	17.958
5.030	18.789
5.051	11.730
5.054	19.412
5.054	19.931
5.054	20.035
5.055	20.761
5.055	21.176
5.055	21.488
5.058	30.830
5.075	13.080
5.940	25.952
5.940	26.263
5.943	32.699
5.958	12.976
5.962	22.734
5.963	25.329
5.964	26.990
5.964	27.716
5.983	15.675
5.983	16.609
5.984	18.166
5.984	19.619
5.985	20.242
5.986	23.460
5.986	23.772
5.986	24.083
5.986	24.187
5.986	24.498
5.986	24.913
5.986	25.017
5.986	25.121
5.988	28.443
5.988	29.170
5.989	31.661
6.008	21.280
6.012	30.208
6.012	31.142
6.099	14.948
6.935	12.976
6.938	21.073
6.939	22.526
6.941	27.820
6.941	28.547
6.959	15.467
6.963	23.356
6.965	29.170
6.966	32.491
6.966	33.322
6.967	34.152
6.984	18.062
6.984	19.204
6.985	20.242
6.986	24.187
6.986	24.706
6.987	25.952
6.987	26.055
6.987	26.678
6.987	27.197
6.988	29.585
6.988	30.311
6.989	30.623
6.989	31.142
6.989	31.557
6.989	32.076
7.010	25.329
7.015	39.031
7.037	35.190
7.037	35.917
7.965	31.038
7.966	32.491
7.966	33.010
7.966	33.218
7.966	33.529
7.967	33.841
7.967	34.152
7.967	34.567
7.968	36.955
7.968	37.370
7.968	38.408
7.969	39.239
7.969	40.796
7.970	41.522
7.970	42.249
7.986	25.121
7.987	25.848
7.987	26.471
7.987	27.093
7.988	28.131
7.988	29.170
7.988	30.311
7.989	31.661
7.991	35.709
7.991	36.540
8.009	24.187
8.944	34.879
8.947	43.806
8.967	36.021
8.968	36.747
8.968	37.474
8.969	40.069
8.969	40.692
8.988	28.547
8.990	33.737
8.990	34.152
8.992	38.927
8.992	39.550
8.993	41.522
8.993	42.457
8.993	43.080
8.994	43.599
9.011	29.481
9.012	30.415
9.012	31.972
9.013	32.595
9.013	33.218
9.015	38.616
9.018	45.571
9.018	46.713
9.018	47.439
9.033	25.225
9.035	31.038
9.041	44.740
9.923	42.457
9.946	40.484
9.946	41.211
9.946	41.834
9.949	47.855
9.949	48.581
9.963	25.744
9.968	36.644
9.968	37.266
9.968	37.474
9.968	38.408
9.968	38.824
9.969	39.239
9.969	39.654
9.969	39.965
9.970	43.287
9.971	45.779
9.971	46.194
9.972	46.609
9.972	46.609
9.988	29.585
9.989	31.557
9.989	32.076
9.989	32.907
9.994	43.599
9.994	44.429
9.994	45.260
10.011	28.443
10.013	33.737
10.014	34.983
10.014	36.228
10.943	33.841
10.944	34.567
10.949	49.723
10.966	33.010
10.970	43.495
10.971	44.948
10.971	45.052
10.971	45.571
10.971	45.675
10.971	46.298
10.971	46.401
10.972	47.855
10.972	48.270
10.972	48.581
10.973	50.761
10.989	32.388
10.990	35.502
10.991	36.436
10.991	37.266
10.991	37.889
10.991	38.097
10.992	38.408
10.992	38.616
11.011	29.585
11.012	30.934
11.015	39.135
11.016	40.173
11.016	40.588
11.016	41.211
11.016	42.353
11.020	51.384
11.040	42.976
11.944	35.398
11.946	40.173
11.947	44.325
11.965	30.415
11.969	39.031
11.969	40.381
11.969	40.900
11.970	41.522
11.970	41.626
11.970	42.976
11.970	43.599
11.970	43.702
11.971	44.740
11.971	44.948
11.971	45.571
11.971	45.779
11.971	46.090
11.972	48.166
11.973	49.619
11.993	42.768
12.012	31.349];
for i=2:size(data.tW,1); if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-8; end; end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'AnavKam2001';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '59PKH'; % Cat of Life
metaData.links.id_ITIS = '563558'; % ITIS
metaData.links.id_EoL = '52232777'; % Ency of Life
metaData.links.id_Wiki = 'Turdoides_squamiceps'; % Wikipedia
metaData.links.id_Taxo = '4706107'; % Taxonomicon
metaData.links.id_avibase = 'E99FE2FE9B88115E'; % Avibase
metaData.links.id_birdlife = 'arabian-babbler-argya-squamiceps'; % Birdlife
metaData.links.id_AnAge = 'Turdoides_squamiceps'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Turdoides_squamiceps}}';
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
bibkey = 'AnavKam2001'; type = 'Article'; bib = [ ... 
'author = {A. Anava and M. Kam and A. Shkolnik and A. A. Degen}, ' ... 
'year = {2001}, ' ...
'title = {Growth Rate and Energetics of {A}rabian Babbler (\emph{Turdoides squamiceps}) Nestlings}, ' ...
'journal = {The Auk}, ' ...
'volume = {118}, ' ...
'pages = {519-524}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Turdoides_squamiceps}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

