function [data, auxData, metaData, txtData, weights] = mydata_Anchoa_tricolor

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Anchoa_tricolor'; 
metaData.species_en = 'Piquitinga anchovy'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L','L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 13];

%% set data
% zero-variate data
data.ab = 6;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(22.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 2.4*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'VarvFont2018';   
  temp.am = C2K(22.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 7;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'guess';
data.Li = 14.9;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 9e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 2.34; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00550*Lp^3.11, see F1';
data.Wwi = 24.5; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight 24.10 g; based on 0.00550*Li^3.11, see F1, gives 24.5 g';
  
data.GSI = 0.05; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'ArauSilv2008';
  temp.GSI = C2K(22.6); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
0.209	3.491
0.289	3.360
0.374	4.283
0.454	6.184
0.536	6.747
0.869	7.561
0.957	7.430];
data.tL(:,1) = data.tL(:,1)*365; % convert yr tod
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(22.6); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VarvFont2018';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
5.004	0.738
5.004	0.631
5.028	0.785
5.100	0.738
5.208	0.738
5.532	0.800
5.544	0.908
5.604	1.092
5.676	1.000
5.676	0.954
5.688	1.138
5.784	1.000
5.808	1.215
5.844	1.092
5.904	1.185
5.952	1.262
5.988	1.323
5.988	1.262
6.012	1.431
6.084	1.554
6.096	1.338
6.096	1.138
6.108	1.231
6.180	1.585
6.180	1.415
6.180	1.308
6.192	1.708
6.264	1.415
6.276	1.769
6.276	1.323
6.312	1.523
6.312	1.354
6.336	1.385
6.336	1.662
6.384	1.738
6.396	1.477
6.420	1.600
6.492	1.846
6.492	1.400
6.528	1.969
6.528	1.769
6.528	1.477
6.528	1.554
6.576	1.723
6.588	1.969
6.588	1.631
6.636	1.831
6.636	1.508
6.636	1.508
6.660	1.723
6.672	1.585
6.696	1.877
6.696	2.154
6.708	2.031
6.732	1.723
6.732	1.662
6.780	1.631
6.792	2.246
6.804	1.523
6.804	1.738
6.804	1.938
6.804	2.154
6.804	2.046
6.816	1.908
6.852	2.231
6.864	1.692
6.864	1.677
6.876	1.815
6.888	1.985
6.900	2.169
6.912	2.000
6.912	2.000
6.936	1.462
6.960	2.077
6.984	1.862
6.984	1.862
6.996	2.385
7.020	1.615
7.032	2.631
7.032	2.200
7.032	1.723
7.044	2.246
7.044	2.308
7.044	2.046
7.056	2.277
7.068	2.569
7.068	2.523
7.080	1.862
7.092	2.415
7.104	1.908
7.104	2.046
7.128	2.554
7.152	2.615
7.152	2.692
7.164	2.446
7.164	2.062
7.176	2.200
7.176	1.908
7.176	1.708
7.200	2.262
7.212	2.492
7.224	2.138
7.236	2.692
7.248	2.354
7.260	2.554
7.260	2.677
7.284	2.477
7.296	2.954
7.308	2.154
7.308	2.569
7.320	2.785
7.332	2.923
7.332	2.354
7.344	2.062
7.344	2.477
7.356	2.323
7.380	2.015
7.380	2.754
7.380	2.277
7.392	2.615
7.392	2.354
7.416	3.092
7.428	2.892
7.428	2.892
7.440	2.492
7.440	2.692
7.440	2.154
7.440	2.031
7.464	2.754
7.464	2.200
7.476	2.338
7.476	2.462
7.488	3.138
7.488	2.277
7.500	2.800
7.500	2.108
7.512	2.615
7.512	2.523
7.512	1.969
7.524	2.723
7.536	3.000
7.548	3.062
7.548	2.862
7.548	2.862
7.548	2.862
7.572	3.323
7.572	2.215
7.596	2.308
7.608	3.077
7.620	2.523
7.620	3.354
7.632	2.738
7.656	3.200
7.668	3.031
7.668	2.662
7.680	2.908
7.692	2.062
7.704	3.569
7.704	3.431
7.716	3.277
7.716	3.338
7.716	3.046
7.716	2.431
7.728	2.154
7.740	2.538
7.752	2.831
7.776	3.508
7.776	3.446
7.776	3.400
7.788	3.600
7.788	3.185
7.788	2.015
7.812	3.846
7.824	2.892
7.836	3.077
7.836	3.031
7.872	3.138
7.884	2.708
7.884	2.769
7.884	2.846
7.884	2.985
7.884	3.246
7.896	2.569
7.908	3.708
7.908	2.523
7.920	3.231
7.944	2.415
7.992	3.123
7.992	2.800
7.992	2.369
8.004	3.015
8.004	2.215
8.004	2.600
8.028	3.400
8.028	2.877
8.028	2.831
8.040	3.585
8.076	2.938
8.088	3.123
8.100	2.723
8.100	3.015
8.112	3.369
8.112	3.446
8.124	3.723
8.124	3.538
8.124	2.246
8.148	3.231
8.208	3.200
8.220	3.092
8.304	3.800
8.304	3.000
8.316	3.323
8.328	3.462
8.400	3.569
8.532	3.615];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'}; 
bibkey.LW_f = 'VarvFont2018';
%
data.LW_m = [ ... % total length (cm), weight (g)
4.266	0.422
4.554	0.552
4.686	0.617
4.782	0.649
4.878	0.552
5.153	0.731
5.501	0.779
5.584	1.266
5.645	1.006
5.729	1.120
5.860	1.234
5.945	1.104
5.956	1.234
5.968	1.445
5.968	1.347
6.064	1.396
6.099	1.688
6.100	1.542
6.100	1.315
6.124	1.429
6.147	1.640
6.148	1.494
6.148	1.315
6.172	1.250
6.207	1.591
6.244	1.477
6.279	1.640
6.280	1.510
6.280	1.364
6.292	1.380
6.303	1.623
6.363	1.753
6.364	1.510
6.388	1.429
6.435	1.786
6.435	1.640
6.460	1.542
6.471	1.899
6.471	1.705
6.508	1.477
6.531	1.623
6.543	1.883
6.544	1.526
6.579	1.705
6.591	1.802
6.603	1.802
6.603	1.786
6.614	1.964
6.639	1.607
6.650	2.273
6.663	1.688
6.686	2.370
6.686	2.045
6.698	2.013
6.699	1.737
6.711	1.851
6.723	1.769
6.770	1.981
6.782	2.127
6.782	1.964
6.783	1.867
6.795	1.640
6.818	1.981
6.879	1.834
6.890	2.305
6.890	2.175
6.902	2.110
6.927	1.786
6.962	1.981
6.973	2.695
6.973	2.468
6.974	2.110
6.986	2.208
7.010	2.289
7.011	1.640
7.033	2.484
7.047	1.867
7.047	1.769
7.069	2.646
7.071	1.916
7.082	2.256
7.082	2.110
7.082	1.997
7.083	1.672
7.093	2.549
7.094	2.078
7.117	2.451
7.141	2.403
7.142	2.321
7.176	2.938
7.177	2.516
7.201	2.776
7.201	2.630
7.202	2.175
7.226	2.289
7.226	2.289
7.226	2.159
7.226	2.078
7.237	2.419
7.249	2.679
7.271	3.360
7.273	2.744
7.275	1.802
7.284	2.971
7.298	2.159
7.320	2.906
7.321	2.435
7.346	2.370
7.356	3.019
7.356	2.987
7.357	2.565
7.358	2.321
7.381	2.695
7.392	2.808
7.406	2.240
7.428	2.857
7.452	2.906
7.452	2.906
7.453	2.646
7.453	2.500
7.466	1.997
7.479	1.737
7.487	3.409
7.488	3.133
7.490	2.354
7.500	2.987
7.502	2.240
7.511	3.247
7.511	3.247
7.513	2.662
7.526	2.078
7.548	3.182
7.549	2.744
7.550	2.370
7.573	2.484
7.573	2.468
7.583	3.490
7.584	2.971
7.595	3.344
7.596	2.808
7.609	2.792
7.621	2.597
7.633	2.549
7.643	3.312
7.644	3.003
7.657	2.727
7.679	3.360
7.681	2.614
7.681	2.451
7.682	2.224
7.692	2.906
7.716	3.198
7.716	3.101
7.728	2.825
7.738	3.734
7.753	2.532
7.762	3.782
7.763	3.360
7.776	3.019
7.777	2.792
7.824	2.841
7.872	2.987
7.882	3.669
7.883	3.328
7.884	3.149
7.897	2.792
7.933	2.744
7.956	2.955
7.957	2.419
7.967	3.312
7.967	3.231
7.968	3.182
7.990	3.831
8.088	2.987
8.374	3.766
8.375	3.409];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'}; 
bibkey.LW_m = 'VarvFont2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00550*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'DKTL'; % Cat of Life
metaData.links.id_ITIS = '551338'; % ITIS
metaData.links.id_EoL = '46562600'; % Ency of Life
metaData.links.id_Wiki = 'Anchoa_tricolor'; % Wikipedia
metaData.links.id_ADW = 'Anchoa_tricolor'; % ADW
metaData.links.id_Taxo = '161845'; % Taxonomicon
metaData.links.id_WoRMS = '275535'; % WoRMS
metaData.links.id_fishbase = 'Anchoa-tricolor'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Anchoa_tricolor}}';  
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
bibkey = 'VarvFont2018'; type = 'Article'; bib = [ ...  
'doi = {10.1590/0001-3765201720160093}, ' ...
'author = {Barbara M. de Carvalho and Nelson F. Fontoura and Henry L. Spach}, ' ...
'year = {2018}, ' ...
'title = {Growth of the Anchovy \emph{Anchoa tricolor} in a brazilian subtropical estuary}, ' ... 
'journal = {Annals of the Brazilian Academy of Sciences}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArauSilv2008'; type = 'Article'; bib = [ ...  
'doi = {10.1590/0001-3765201720160093}, ' ...
'author = {Ara\''{u}jo, F,G. and Silva, M.A. and Azevedo, M.C.C. and Santos, J.N.S.}, ' ...
'year = {2008}, ' ...
'title = {Spawning season, recruitment and early life distribution of \emph{Anchoa tricolor} ({S}pix and {A}gassiz, 1829) in a tropical bay in southeastern Brazil}, ' ... 
'journal = {Braz. J. Biol.}, ' ...
'volume = {68(4)}, ' ...
'pages = {823-829}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Anchoa-tricolor.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
