function [data, auxData, metaData, txtData, weights] = mydata_Synodus_foetens
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Synodontidae';
metaData.species    = 'Synodus_foetens'; 
metaData.species_en = 'Inshore lizardfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.8); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 12];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 12];

%% set data
% zero-variate data
data.am = 7*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'guess';  
  temp.am = C2K(24.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess';
data.Li = 38;     units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'YangChen2013';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Trachinocephalus_myops: pi/6*0.08^3';
data.Wwi = 419; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00427*Li^3.16, see F1, gives 904 g';

data.Ri = 2*58599/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(24.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity of Synodus_saurus at 31 cm: 426200*(38/32.6)^3';
  
% uni-variate data
% time-length
data.tL = [ ... % age (yr) ~ fork length (cm) 
0.962	13.366
0.962	20.920
0.971	13.753
0.971	15.884
0.971	11.913
0.980	4.649
0.980	8.329
0.990	10.944
0.990	12.785
0.990	14.044
0.990	17.143
0.999	9.395
0.999	12.688
1.008	14.625
1.027	12.203
1.933	20.048
1.942	20.533
1.942	19.467
1.951	13.269
1.951	12.203
1.951	18.983
1.951	18.402
1.951	19.080
1.951	17.240
1.961	32.446
1.961	25.375
1.961	7.070
1.970	27.312
1.970	23.245
1.970	22.663
1.970	19.564
1.970	18.499
1.970	17.433
1.970	16.852
1.970	16.271
1.970	14.237
1.970	11.332
1.970	9.685
1.970	8.620
1.970	21.308
1.970	17.821
1.979	33.995
1.979	29.734
1.979	28.378
1.979	26.828
1.979	25.860
1.979	24.794
1.979	24.116
1.979	21.985
1.979	21.404
1.979	10.654
1.979	10.073
1.979	7.748
1.979	19.661
1.979	20.726
1.979	17.821
1.988	15.109
1.988	18.886
1.988	19.661
2.007	20.726
2.886	24.504
2.941	29.540
2.950	36.513
2.950	22.857
2.960	23.632
2.960	12.203
2.969	35.932
2.969	30.412
2.969	27.409
2.969	17.724
2.969	15.206
2.969	13.656
2.969	10.944
2.969	23.535
2.978	41.356
2.978	38.547
2.978	34.576
2.978	33.801
2.978	32.252
2.978	31.477
2.978	28.475
2.978	24.891
2.978	24.310
2.978	22.276
2.978	13.075
2.987	33.123
2.987	31.186
2.987	26.731
2.987	22.663
2.987	21.404
2.987	20.823
2.987	19.952
2.987	19.080
2.987	18.692
2.987	17.143
2.987	14.528
2.987	10.557
2.997	23.245
2.997	16.465
2.997	9.685
3.006	25.860
3.006	11.622
3.015	22.082
3.015	15.690
3.015	24.310
3.015	23.341
3.958	34.964
3.958	28.184
3.968	31.380
3.968	31.283
3.968	26.538
3.968	27.603
3.968	24.116
3.968	24.019
3.977	39.516
3.977	33.317
3.977	33.027
3.977	32.349
3.977	30.605
3.977	29.831
3.977	27.409
3.977	25.956
3.977	25.375
3.977	24.213
3.977	23.438
3.986	12.010
3.986	13.559
3.986	14.334
3.986	14.722
3.986	16.077
3.986	17.337
3.986	35.835
3.986	29.443
3.986	28.959
3.986	28.668
3.986	24.697
3.986	22.663
3.986	21.695
3.986	21.114
3.986	18.111
3.986	25.278
3.995	34.189
3.995	21.211
3.995	19.177
3.995	24.988
3.995	25.569
3.995	26.344
4.005	15.206
4.005	22.470
4.005	20.048
4.005	19.564
4.005	26.344
4.014	27.022
4.929	26.150
4.948	25.278
4.957	23.923
4.966	21.695
4.966	20.726
4.966	25.763
4.976	30.896
4.976	25.860
4.976	23.438
4.976	22.276
4.976	21.308
4.976	14.044
4.985	36.610
4.985	30.218
4.985	29.927
4.985	28.571
4.985	27.797
4.985	27.409
4.985	24.504
4.985	23.245
4.985	27.119
4.985	25.569
4.994	35.642
4.994	34.092
4.994	32.542
4.994	29.249
4.994	29.249
4.994	29.153
4.994	26.828
4.994	24.988
4.994	24.891
4.994	22.276
4.994	22.857
4.994	18.402
4.994	18.015
4.994	26.925
5.003	40.097
5.003	21.114
5.003	27.312
5.013	26.441
5.013	20.436
5.965	24.697
5.965	26.344
5.975	36.029
5.975	23.826
5.984	31.283
5.984	28.862
5.984	26.828
5.984	25.860
5.984	25.666
5.984	23.051
5.984	27.119
5.993	29.346
5.993	28.281
5.993	21.114
6.002	27.893
6.002	26.731
6.002	26.731
6.002	20.726
6.002	27.312
6.021	27.797
6.983	29.831
6.983	28.668
6.992	42.034
6.992	20.726
7.001	40.678
7.001	31.864
7.001	28.765
7.010	32.736
7.010	27.409
7.020	25.763
7.972	26.538
7.991	28.378
8.018	27.119];
data.tL(:,1) = (0.2+data.tL(:,1))*365; % set origin at birth
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-2;end;end
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(24.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Jeff2007'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.00427*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7B9PJ'; % Cat of Life
metaData.links.id_ITIS = '162376'; % ITIS
metaData.links.id_EoL = '46563918'; % Ency of Life
metaData.links.id_Wiki = 'Synodus_foetens'; % Wikipedia
metaData.links.id_ADW = 'Synodus_foetens'; % ADW
metaData.links.id_Taxo = '42979'; % Taxonomicon
metaData.links.id_WoRMS = '158758'; % WoRMS
metaData.links.id_fishbase = 'Synodus-foetens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Synodus_foetens}}';
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
bibkey = 'Jeff2007'; type = 'phdthesis'; bib = [ ...
'author = {Sarah Ann Branson Jeffers}, ' ... 
'year   = {2007}, ' ...
'title  = {Ecology of Inshore Lizardfish, Synodus Foetens, in the Northern Gulf of Mexico}, ' ...
'school = {University of West Florida Libraries}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Synodus-foetens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

