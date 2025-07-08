function [data, auxData, metaData, txtData, weights] = mydata_Trygonoptera_personata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Urolophidae';
metaData.species    = 'Trygonoptera_personata'; 
metaData.species_en = 'Masked stingaree';
 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 10];                          
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
data.ab = 11*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'WhitHall2002';    
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 1460;  units.ap = 'd';   label.ap = 'age at puberty';           bibkey.ap = 'AnAge';
  temp.ap = C2K(22);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'for females';
data.am = 16*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'WhitHall2002';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'for females, 10 yr for males';

data.Lb  = 12;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'WhitHall2002';
data.Lp = 23;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'WhitHall2002';
  comment.Lp = 'for females';
data.Lpm = 22;   units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty'; bibkey.Lpm  = 'WhitHall2002'; 
  comment.Lpm = 'for males';
data.Li  = 31.1;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li = 'WhitHall2002'; 
  comment.Li = 'for females';
data.Lim  = 26.9;  units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'WhitHall2002'; 
  comment.Lim = 'for males';

data.Wwi =350000 * (31.1/200)^3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'guess'; 
data.Wwim =350000 * (26.9/200)^3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'guess'; 
 comment.Wwim = 'Guess based on Trygonoptera testacea grows to 2 m disc width and a weight of 350 kg (Austr museum)';

data.Ri  = 1.2/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), disk width (cm)
0.107	11.828
0.108	12.544
0.109	13.350
0.110	13.797
0.110	14.424
0.507	12.986
0.507	13.523
0.508	13.881
0.508	14.329
0.509	14.687
0.509	14.956
0.510	15.314
0.510	15.672
0.511	16.030
0.511	16.477
0.730	14.774
0.773	13.341
0.773	13.878
0.774	14.325
0.775	15.489
0.776	16.026
0.776	16.295
0.777	16.742
0.777	17.100
0.903	11.280
0.903	11.728
0.953	15.934
0.955	17.366
0.956	18.083
0.990	10.384
0.993	12.622
0.996	14.859
1.039	13.964
1.040	14.501
1.041	15.217
1.083	13.605
1.219	16.289
1.261	14.587
1.262	15.035
1.262	15.662
1.304	13.244
1.304	13.781
1.305	14.229
1.347	12.975
1.352	16.734
1.530	17.269
1.530	17.538
1.531	17.806
1.531	18.164
1.531	18.522
1.532	18.880
1.698	10.285
1.706	16.819
1.796	17.624
1.797	18.250
1.842	19.145
1.974	18.516
2.019	19.232
2.191	15.291
2.193	16.455
2.193	17.081
2.194	17.976
2.236	15.559
2.282	17.438
2.324	15.826
2.325	16.095
2.461	19.136
2.505	18.509
2.550	19.493
2.552	20.478
2.641	20.835
2.771	19.401
2.772	19.759
3.038	20.203
3.039	20.829
3.127	20.381
3.213	18.768
3.214	19.305
3.257	18.320
3.301	18.051
3.614	20.643
3.702	20.731
3.703	21.089
3.703	21.447
3.704	21.984
3.791	20.461
3.969	21.802
4.102	22.158
4.187	19.292
4.232	19.650
4.277	20.007
4.277	20.455
4.633	21.614
4.633	22.240
4.634	22.867
4.677	21.971
4.855	22.416
4.943	21.789
4.944	22.684
4.989	23.399
5.032	22.235
5.207	20.621
5.296	21.068
5.296	21.515
5.297	21.873
5.297	22.321
5.563	22.675
5.785	23.030
5.830	23.925
5.872	22.134
6.007	23.833
6.138	22.310
6.228	23.114
6.315	22.218
6.537	22.662
6.584	24.810
6.627	24.093
6.715	23.824
6.715	24.092
6.935	22.657
6.938	25.432
7.202	23.907
7.516	27.304
7.602	25.512
7.645	24.438
7.777	23.809
8.087	24.163
8.132	24.521
8.264	23.982
8.352	23.265
8.398	25.054
8.619	24.783
8.620	25.320
8.795	23.706
8.840	24.690
8.885	25.406
9.195	25.760
9.238	24.416
9.326	23.968
9.549	25.397
9.594	25.844
9.594	26.202
9.683	26.380
9.773	27.542
9.815	25.751
9.857	24.139
9.858	24.856
9.993	26.286
9.993	26.555
10.300	24.581
10.301	25.208
10.346	25.923
10.613	27.083
10.613	27.352
10.745	26.634
10.924	27.885
11.058	28.868
11.275	25.374
11.276	26.358
11.277	26.985
11.629	25.816
11.633	28.949
11.808	27.246
12.029	27.333
12.562	28.489
12.649	27.324
12.738	28.039
12.825	26.337
13.579	28.297
13.800	27.846
13.802	29.815
13.977	28.202
14.776	29.713
15.349	27.825
15.614	27.643
15.615	28.985
16.278	27.992
16.279	28.708
16.680	31.209];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
temp.tL_f = C2K(22); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WhitHall2002'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disk width (cm)
0.016	10.324
0.106	11.662
0.107	12.377
0.108	13.091
0.109	13.627
0.154	14.073
0.507	14.339
0.507	14.696
0.550	13.356
0.550	13.803
0.553	15.767
0.553	16.303
0.554	16.838
0.593	12.731
0.596	15.231
0.732	17.730
0.769	12.373
0.770	12.998
0.770	13.355
0.771	13.980
0.775	17.016
0.816	14.694
0.818	16.123
0.860	14.783
0.861	15.229
0.906	15.854
0.947	13.711
1.039	16.746
1.040	17.282
1.076	11.121
1.082	15.317
1.126	15.853
1.169	14.335
1.170	15.585
1.215	16.388
1.300	13.888
1.301	14.155
1.301	14.691
1.343	12.905
1.346	15.227
1.388	13.173
1.388	13.619
1.526	17.993
1.568	16.386
1.570	17.725
1.616	19.064
1.659	18.528
1.703	18.171
1.745	17.010
1.746	17.367
1.747	17.903
1.881	19.241
1.922	17.277
1.967	17.901
1.968	18.437
2.013	18.883
2.146	19.597
2.185	15.400
2.185	16.114
2.186	16.829
2.275	17.364
2.276	17.810
2.277	18.346
2.544	20.398
2.631	19.326
2.631	19.683
2.677	21.111
2.720	20.397
2.762	18.790
2.763	19.415
2.805	17.896
2.808	19.861
2.853	20.396
2.986	21.110
3.116	19.680
3.247	18.162
3.293	19.768
3.336	19.143
3.379	18.339
3.559	20.392
3.559	21.017
3.560	21.285
3.604	21.642
3.737	21.641
3.779	20.480
3.780	20.837
3.870	22.176
3.957	21.640
4.044	20.835
4.087	19.942
4.088	20.478
4.178	21.638
4.264	19.673
4.264	19.941
4.267	22.173
4.398	21.190
4.484	19.583
4.529	20.654
4.573	20.386
4.619	21.546
4.619	21.903
4.664	22.171
4.665	22.975
5.016	21.723
5.017	22.169
5.280	21.364
5.281	21.542
5.368	20.649
5.369	22.078
5.635	22.344
5.767	22.789
5.768	23.593
6.031	21.538
6.252	22.072
6.607	23.856
6.650	23.141
6.872	24.211
7.048	23.675
7.049	24.746
7.311	22.691
7.312	23.495
7.313	23.941
7.355	22.512
7.445	23.315
7.578	24.118
7.798	23.581
8.064	24.562
8.195	23.757
8.461	24.648
9.210	24.108
9.299	24.643
9.300	25.536
9.608	24.999
10.052	26.871];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to 
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WhitHall2002'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;
weights.Wwi = 3 * weights.Wwi;
weights.Wwim = 3 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'mother feeds neonates with uterine milk';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '59F2X'; % Cat of Life
metaData.links.id_ITIS = '564433'; % ITIS
metaData.links.id_EoL = '46561040'; % Ency of Life
metaData.links.id_Wiki = 'Trygonoptera_personata'; % Wikipedia
metaData.links.id_ADW = 'Trygonoptera_personata'; % ADW
metaData.links.id_Taxo = '189636'; % Taxonomicon
metaData.links.id_WoRMS = '283062'; % WoRMS
metaData.links.id_fishbase = 'Trygonoptera-personata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trygonoptera_personata}}';   % replace my_pet by latin species name
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
bibkey = 'WhitHall2002'; type = 'Article'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {W. T. White and  N. G. Hall and I. C. Potter}, ' ...
'year = {2002}, ' ...
'title  = {Reproductive biology and growth during pre- and postnatal life of \emph{Trygonoptera personata} and \emph{T. mucosa} ({B}atoidea: {U}rolophidae)}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {140}, ' ...
'pages = {699-712}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Trygonoptera_personata}}';   % replace my_pet by latin species name
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnDiv'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Trygonoptera_personata/}}';   % replace my_pet by latin species name
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SASAA'; type = 'Misc'; bib = ...
'howpublished = {\url{www.wpangling.co.za/SASAA~Records/Ladies~Records.pdf}}';   % replace my_pet by latin species name
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 