function [data, auxData, metaData, txtData, weights] = mydata_Hypanus_guttatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Dasyatidae';
metaData.species    = 'Hypanus_guttatus'; 
metaData.species_en = 'Longnose stingray'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 10];                          
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
data.ab = 7*30.5; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(27.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'GianSant2019';   
  temp.am = C2K(27.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 17; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'GianSant2019';
data.Lp  = 53; units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'GianSant2019';
  comment.Lp = '50-56 cm';
data.Lpm  = 43.5; units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'GianSant2019';
  comment.Lpm = '41-46 cm';
data.Li  = 98;   units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'TeixSilv2016';

data.Wwi = 21.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'TeixSilv2016';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'GianSant2019';   
  temp.Ri = C2K(27.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-4 pups per litter, assumed 1 litter per yr';
  
% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.048	14.537
0.094	13.454
0.265	23.656
0.387	21.056
0.510	20.626
0.557	23.231
0.602	19.544
0.710	22.367
0.833	23.239
0.834	27.144
1.311	32.799
1.478	21.522
1.494	23.909
1.602	23.478
1.680	31.074
1.724	22.614
1.909	21.317
2.326	36.083
2.342	39.554
2.448	30.879
2.510	32.400
2.510	33.918
3.371	40.018
3.448	36.549
3.448	40.237
3.571	41.760
3.741	42.415
3.801	37.427
5.988	69.167
6.218	61.363
6.695	69.838
7.002	63.555
7.077	55.964
7.079	66.378
7.185	58.787
7.188	75.277
7.617	66.393
7.770	60.106
7.770	65.096
7.893	62.279
8.369	56.652
8.601	67.290
8.723	61.001
8.725	77.274
8.816	68.164
8.847	70.551
8.985	65.565
9.015	63.396
9.261	64.271
9.415	68.398
9.767	58.428
9.769	71.446
10.091	63.211
10.567	64.743
10.599	72.772
10.725	89.047
10.769	76.248
10.770	85.143
10.829	64.317
10.875	67.139
11.568	72.583
11.708	85.605
11.767	66.947
11.767	70.636
11.768	75.843
12.767	80.645
13.675	83.926];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
  temp.tL_f = C2K(27.6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GianSant2019';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.018	17.791
0.110	17.143
0.111	23.652
0.156	19.531
0.188	26.908
0.218	23.221
0.310	15.630
0.356	19.753
0.371	17.584
0.510	17.154
0.571	14.770
0.648	16.941
0.664	19.328
0.678	13.037
0.832	13.909
0.833	19.550
0.849	28.663
0.895	22.806
0.909	16.081
1.265	31.279
1.310	23.903
1.356	27.810
1.433	26.077
1.434	32.585
1.464	29.983
1.541	31.504
1.556	28.033
1.633	26.082
1.679	29.555
1.740	25.218
1.848	23.919
1.879	25.872
2.171	30.654
2.172	33.041
2.479	35.436
2.556	31.533
2.648	35.658
2.679	34.140
2.740	29.586
2.741	37.179
3.141	38.927
3.525	40.674
3.586	37.204
3.786	35.691
5.509	52.230
5.555	47.892
5.678	50.499
6.093	50.728
6.354	49.434
6.462	47.484
6.724	52.699
6.770	54.436
6.830	47.495
7.261	48.809
7.415	48.163
7.599	46.866
7.631	55.546
7.768	49.692
7.785	58.371
7.799	52.079
8.752	48.201
8.752	50.371
8.752	52.758
9.767	55.391];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(27.6); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GianSant2019';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight for Dasyatis pastinaca: Ww in g =  0.01230 *(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
F2 = 'ovoviviparous';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3NMJD'; % Cat of Life
metaData.links.id_ITIS = '160956'; % ITIS
metaData.links.id_EoL = '51263535'; % Ency of Life
metaData.links.id_Wiki = 'Hypanus_guttatus'; % Wikipedia
metaData.links.id_ADW = 'Dasyatis_guttata'; % ADW
metaData.links.id_Taxo = '4974633'; % Taxonomicon
metaData.links.id_WoRMS = '1042858'; % WoRMS
metaData.links.id_fishbase = 'Hypanus-guttatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hypanus_guttatus}}'; 
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
bibkey = 'GianSant2019'; type = 'Article'; bib = [ ... 
'author = {Michel D. Gianeti and Francisco M. Santana and Leandro Yokota and Jonas E. Vasconcelos and June F. Dias and Rosangela P. Lessa}, ' ...
'year = {2019}, ' ...
'title = {Age structure and multi-model growth estimation of longnose stingray \emph{Hypanus guttatus} ({D}asyatidae: {M}yliobatoidei) from north-east {B}razil}, ' ...
'journal = {J. fish Biol.}, ' ...
'volume = {94}, ' ...
'pages = {481-488}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TeixSilv2016'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.13255}, ' ...
'author = {E. C. Teixeira and V. E. L. Silva and N. N. Fabr\''{e} and V. S. Batista}, ' ...
'year = {2016}, ' ...
'title = {Length-weight relationships for four stingray species from the tropical {A}tlantic {O}cean}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {94}, ' ...
'pages = {481-488}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Hypanus-guttatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  