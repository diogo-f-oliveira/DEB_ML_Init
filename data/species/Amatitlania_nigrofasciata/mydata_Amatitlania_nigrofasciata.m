function [data, auxData, metaData, txtData, weights] = mydata_Amatitlania_nigrofasciata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Amatitlania_nigrofasciata'; 
metaData.species_en = 'Convict cichlid'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'THn','TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 09 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.am = 6*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'IshiTach2010';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 4.72;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'based on SL 3.73 cm and F2';
data.Li  = 12;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'Wiki';

data.Wwb = 8.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2.5 mm for Oreochromis aureus: pi/6*0.25^3';
data.Wwp = 2.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'IshiTach2010';
  comment.Wwp = 'based on 0.01862*Lp^2.99, see F1';
data.Wwi = 36;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';

 
% uni-variate data

% time-length
data.tL_f = [ ... % time (yr), std length (cm)
0.220	3.185
0.221	3.506
0.246	3.727
0.333	3.365
0.334	3.707
0.335	3.888
0.416	4.410
0.480	4.149
0.480	4.329
0.505	4.470
0.509	3.345
0.510	3.526
0.510	3.667
0.511	3.928
0.576	4.068
0.576	4.229
0.576	4.329
0.577	4.430
0.577	4.490
0.577	4.550
0.578	4.711
0.589	3.245
0.598	3.526
0.599	3.908
0.636	3.004
0.664	4.249
0.761	4.369
0.768	4.068
0.826	4.711
0.841	4.450
0.903	3.667
0.904	3.908
0.913	4.189
0.913	4.349
0.931	4.771
0.992	3.888
0.993	4.149
0.993	4.269
0.994	4.450
1.072	3.928
1.073	4.088
1.079	3.687
1.082	4.470
1.091	4.651
1.109	5.333
1.147	4.831
1.181	5.313
1.236	4.932
1.236	5.072
1.271	3.546
1.317	5.153
1.324	4.912
1.358	5.554
1.404	4.811
1.411	4.711
1.412	5.012
1.432	3.506
1.477	5.273
1.510	5.434
1.511	5.635
1.516	4.731
1.517	5.052
1.600	6.157
1.606	5.273
1.606	5.514
1.661	4.912
1.670	5.253
1.726	5.293
1.740	4.691
1.748	4.711
1.749	5.133
1.751	5.514
1.831	5.494
1.838	5.333
1.847	5.614
2.013	4.912
2.095	5.454
2.164	4.510
2.263	5.233
2.325	4.691
2.352	5.574
2.426	6.076
2.505	5.795
2.600	5.273
2.926	4.590
3.602	5.373];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
data.tL_f(:,2) = data.tL_f(:,2)/ 0.79; % convert SL to TL
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'total length', 'female'};  
temp.tL_f    = C2K(29);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'IshiTach2010';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time (yr), std length (cm)
0.243	3.190
0.245	4.721
0.316	3.417
0.348	3.672
0.404	3.955
0.413	4.296
0.413	4.607
0.491	2.850
0.499	2.737
0.501	4.040
0.509	4.381
0.509	4.551
0.510	4.806
0.516	3.644
0.532	3.190
0.565	4.040
0.588	3.445
0.588	3.644
0.589	3.842
0.589	4.522
0.590	4.834
0.596	2.935
0.596	3.219
0.606	5.146
0.652	3.389
0.661	4.324
0.685	3.672
0.727	5.316
0.734	4.806
0.740	2.907
0.805	4.040
0.805	4.211
0.823	5.287
0.830	4.692
0.902	4.749
0.903	5.117
0.903	5.372
0.903	5.684
0.917	3.190
0.917	3.417
0.917	3.587
0.918	4.126
0.924	2.822
0.981	3.474
0.983	4.947
0.990	4.721
0.997	3.332
1.006	3.870
1.007	5.316
1.008	5.684
1.069	3.700
1.071	5.486
1.072	5.741
1.072	6.024
1.072	6.308
1.073	6.478
1.078	4.012
1.078	4.409
1.078	4.551
1.087	5.004
1.160	5.599
1.176	5.713
1.176	5.939
1.176	6.053
1.201	6.166
1.233	6.223
1.233	6.563
1.253	2.964
1.256	5.599
1.265	6.903
1.280	5.344
1.321	6.506
1.344	5.769
1.344	5.883
1.345	5.996
1.345	6.279
1.350	3.955
1.401	6.421
1.408	5.202
1.410	6.818
1.497	5.826
1.498	7.130
1.506	6.789
1.513	6.166
1.521	6.393
1.528	4.806
1.570	7.073
1.585	6.166
1.602	6.534
1.602	6.818
1.658	6.733
1.674	6.393
1.744	4.777
1.745	5.599
1.746	6.733
1.747	6.960
1.754	6.534
1.755	7.130
1.761	5.769
1.762	6.223
1.763	7.328
1.841	5.287
1.842	6.279
1.842	6.449
1.842	6.648
1.851	7.016
1.851	7.300
1.921	5.032
1.921	5.316
1.937	5.713
1.947	6.761
2.002	6.138
2.009	5.316
2.083	6.478
2.091	6.874
2.170	6.053
2.171	6.251
2.179	6.704
2.243	6.251
2.257	4.522
2.332	7.016
2.337	4.947
2.499	6.251
2.500	6.704
2.506	5.174
2.514	5.543
2.515	5.713
2.596	6.421
2.596	6.648
2.667	6.024
2.675	5.543
2.756	6.166
2.827	5.231
2.932	5.854
3.173	7.016
3.334	6.818
3.581	6.081
3.752	8.291
3.759	7.215];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
data.tL_m(:,2) = data.tL_m(:,2)/ 0.79; % convert SL to TL
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'total length', 'male'};  
temp.tL_m    = C2K(29);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'IshiTach2010';
comment.tL_m = 'data for males';

% weight - fecundity
data.WwN = [ % wet weight (g), fecundity (#)
2.444	51.177
2.538	65.076
3.045	91.363
3.171	108.351
3.207	46.626
3.519	133.078
3.618	69.817
3.964	133.124
4.124	114.622
4.280	160.934
4.317	77.605
4.472	140.892
4.660	188.751
4.885	144.021
5.233	168.748
5.269	108.567
5.488	151.799
5.490	127.108
5.966	131.787
6.063	108.648
6.445	105.601
6.599	175.062
6.730	119.520
6.821	181.257
6.918	151.946
7.234	178.213
7.329	195.198
7.461	113.422
7.614	201.401
7.617	153.561
7.772	218.392
7.966	164.400
8.376	210.738
8.407	232.346
8.666	150.583
8.854	204.615
8.876	349.679
9.551	235.550
9.716	141.432
11.648	232.680
11.737	332.998
12.377	262.076];
units.WwN   = {'g', '#'};  label.WwN = {'wet weight', 'batch fecundity'};  
temp.WwN    = C2K(29);  units.temp.WwN = 'K'; label.temp.WwN = 'temperature';
bibkey.WwN = 'IshiTach2010';
    
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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight for Oreochromis aureus: Ww in g= 0.01862*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length: SL = 0.79 * TL'; 
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'CJC9'; % Cat of Life
metaData.links.id_ITIS = '648207'; % ITIS
metaData.links.id_EoL = '4599944'; % Ency of Life
metaData.links.id_Wiki = 'Amatitlania_nigrofasciata'; % Wikipedia
metaData.links.id_ADW = 'Amatitlania_nigrofasciata'; % ADW
metaData.links.id_Taxo = '1126338'; % Taxonomicon
metaData.links.id_WoRMS = '991202'; % WoRMS
metaData.links.id_fishbase = 'Amatitlania-nigrofasciata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amatitlania_nigrofasciata}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Amatitlania-nigrofasciata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CastCast2020'; type = 'article'; bib = [ ... 
'author = {Castro-Mej\''{i}a, G. and Castro-Mej\''{i}a, J. and Castro-Castell\''{o}n, A.E. and Mart\''{i}nez-Meing\"{u}er, A.M. and Rivera-Ram\''{i}rez, A.O.}, ' ... 
'year = {2020}, ' ...
'title = {Preliminary study of the growth of \emph{Amatitlania nigrofasciata} ({G}\"{u}nther, 1867) (Convict cichlid), fed with inert diets (dry and wet) in a Biofloc system, in laboratory conditions}, ' ...
'journal = {International Journal of Fisheries and Aquatic Studies}, ' ...
'volume = {8(3)}, ' ...
'pages = {321-326}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'IshiTach2010'; type = 'article'; bib = [ ... 
'doi = {10.1007/s10641-010-9641-x}, ' ...
'author = {Tetsuroh Ishikawa and Katsunori Tachihara}, ' ... 
'year = {2010}, ' ...
'title = {Life history of the nonnative convict cichlid \emph{Amatitlania nigrofasciata} in the {H}aebaru {R}eservoir on {O}kinawa-jima {I}sland, {J}apan}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {88}, ' ...
'pages = {283-292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

