function [data, auxData, metaData, txtData, weights] = mydata_Pseudupeneus_maculatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Mullidae';
metaData.species    = 'Pseudupeneus_maculatus'; 
metaData.species_en = 'Spotted goatfish';

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0pMp', 'piMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 05];

%% set data
% zero-variate data

data.am = 6 * 365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'SantLess2004';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 30;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb = 6.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 83.5;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01072*Lp^3.10, see F1';
data.Wwi = 407;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^3.10, see F1';

data.Ri  = 26432/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm) 
0.486	5.027
0.662	6.312
0.712	5.305
0.754	6.982
0.763	4.857
0.788	5.472
0.872	6.366
0.880	7.204
0.913	7.987
0.964	6.197
1.006	6.868
1.014	5.749
1.047	7.538
1.073	5.581
1.081	7.202
1.089	6.587
1.106	4.966
1.123	4.798
1.140	6.251
1.182	8.152
1.183	7.369
1.198	8.599
1.291	8.431
1.332	10.052
1.559	9.211
1.709	12.396
1.793	11.780
2.011	12.449
2.020	15.021
2.021	13.903
2.028	14.350
2.036	16.754
2.053	15.860
2.061	15.356
2.078	17.089
2.087	18.431
2.095	18.822
2.128	15.188
2.137	14.573
2.145	12.224
2.146	16.138
2.162	12.560
2.163	16.641
2.170	13.398
2.171	12.895
2.229	18.262
2.237	17.088
2.238	17.871
2.239	20.442
2.254	12.894
2.255	14.124
2.271	9.596
2.272	16.696
2.278	15.466
2.279	15.969
2.288	17.367
2.296	11.832
2.304	13.900
2.313	13.173
2.321	18.149
2.322	18.653
2.330	12.726
2.331	19.379
2.338	17.758
2.346	16.695
2.380	12.334
2.388	16.024
2.405	15.577
2.480	13.116
2.539	12.556
2.573	17.197
2.574	18.371
2.575	19.042
2.606	16.749
2.615	16.190
2.616	17.699
2.631	14.456
2.640	15.519
2.641	17.252
2.642	18.370
2.643	11.996
2.648	16.804
2.682	14.959
2.681	16.357
2.690	17.195
2.698	12.052
2.715	14.456
2.740	13.002
2.757	15.126
2.782	14.008
2.783	12.945
2.807	16.244
2.808	16.412
2.809	15.517
2.824	14.734
2.825	11.883
2.832	11.379
2.841	12.386
2.866	17.026
2.874	16.076
2.883	15.069
2.933	17.473
2.941	16.522
2.975	17.976
2.976	16.131
2.983	15.292
3.008	20.435
3.009	16.913
3.010	14.341
3.011	14.900
3.017	18.534
3.018	19.373
3.034	16.074
3.050	21.329
3.057	22.224
3.058	19.596
3.059	17.472
3.075	22.727
3.076	20.882
3.084	18.478
3.092	17.136
3.101	19.260
3.109	16.521
3.117	20.211
3.126	15.235
3.158	20.769
3.159	16.520
3.168	21.664
3.176	17.918
3.193	16.017
3.201	20.210
3.226	21.887
3.234	18.924
3.235	17.134
3.243	22.222
3.244	18.197
3.260	20.657
3.261	19.482
3.268	21.160
3.310	16.519
3.318	17.861
3.327	18.699
3.335	21.662
3.344	20.320
3.377	19.146
3.385	23.786
3.386	22.221
3.402	19.761
3.461	19.201
3.494	20.375
3.503	20.654
3.511	18.250
3.512	18.977
3.528	19.480
3.545	20.430
3.578	18.529
3.579	22.387
3.612	20.821
3.628	19.926
3.629	22.946
3.637	18.640
3.654	19.255
3.712	18.807
3.713	22.553
3.721	23.392
3.737	19.534
3.813	16.235
3.897	21.378
3.938	20.091
3.939	18.861
3.955	18.302
3.964	18.078
3.972	22.383
3.973	20.259
3.974	17.687
3.980	20.985
3.981	19.476
3.989	21.488
4.022	21.935
4.064	20.425
4.073	21.376
4.148	21.934
4.332	26.070
4.341	27.244
4.358	25.678
4.359	26.405
4.391	24.448
4.408	25.734
4.425	27.802
4.466	22.770
4.483	23.664
4.492	21.763
4.617	20.141
4.642	20.756
4.718	22.656
4.735	21.761
4.736	23.215
4.869	22.039
5.313	28.074
5.321	29.304
5.330	27.291
5.380	29.023];
data.tL(:,1) = 365*data.tL(:,1); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(26.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SantLess2004';
  
% length-weight
data.LW = [ ... % length (cm), weight (g)
4.491	3.030
4.723	7.071
5.232	6.061
5.371	4.040
5.556	7.071
5.880	4.040
6.250	5.051
6.575	8.081
6.759	4.040
7.269	10.101
7.408	10.101
7.918	12.121
8.612	15.152
9.122	18.182
9.770	20.202
11.065	9.091
11.762	31.313
12.040	35.354
12.272	41.414
12.780	34.343
12.827	43.434
13.104	28.283
14.771	32.323
15.284	84.848
16.163	78.788
16.391	30.303
16.859	92.929
17.880	125.253
18.019	131.313
18.157	114.141
18.669	151.515
18.946	141.414
19.040	154.545
19.133	161.616
19.549	161.616
19.782	169.697
19.876	187.879
20.011	144.444
20.106	178.788
20.197	160.606
20.381	143.434
20.615	176.768
20.755	184.849
20.893	169.697
21.683	217.172
22.889	248.485
23.540	277.778
25.811	314.141
27.294	337.374
27.575	367.677
27.944	361.616
29.246	430.303];
units.LW   = {'cm', 'g'};  label.LW = {'fork length','weight'};  
bibkey.LW = 'SantLess2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set2,set1};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01072*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4PFGG'; % Cat of Life
metaData.links.id_ITIS = '169421'; % ITIS
metaData.links.id_EoL = '46578736'; % Ency of Life
metaData.links.id_Wiki = 'Pseudupeneus_maculatus'; % Wikipedia
metaData.links.id_ADW = 'Pseudupeneus_maculatus'; % ADW
metaData.links.id_Taxo = '45359'; % Taxonomicon
metaData.links.id_WoRMS = '159421'; % WoRMS
metaData.links.id_fishbase = 'Pseudupeneus-maculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudupeneus_maculatus}}';
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
bibkey = 'SantLess2004'; type = 'incollection'; bib = [ ... 
'author = {Francisco M. Santana and Rosangela P. Lessa and Marcelo F. de N\''{o}brega}, ' ... 
'editor = {R. P. Lessa and M. F. N\''{o}brega and J\''{u}nior, J. L. B.}, ' ...
'publisher = {Universidade Federal Rural de Pernambuco, Recife-Brazil, Departamento de Pesca}, ' ...
'year = {2004}, ' ...
'title = {\emph{Pseudupeneus maculatus}. Dinâmica de popula\c{c}\~{o}es e avalia\c{c}\~{a}o de estoques dos recursos pesqueiros da regi\~{a}o nordeste}, ' ...
'booktitle = {DIMAR}, ' ...
'volume = {II}, ' ...
'pages = {151-169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pseudupeneus-maculatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
