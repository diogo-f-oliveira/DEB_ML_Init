  function [data, auxData, metaData, txtData, weights] = mydata_Austroglanis_gilli
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Austroglanididae';
metaData.species    = 'Austroglanis_gilli'; 
metaData.species_en = 'Clanwilliam catfish'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L_f'}; 
metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 108];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 08];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Mtho2009';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.23;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';   bibkey.Lp = 'Mtho2009';
data.Li = 13.7;     units.Li = 'cm';   label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 3.1e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Mtho2009';
  comment.Wwb = 'based on egg diameter of 1.8 mm: pi/6*0.18^3';
data.Wwp = 2.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = {'fishbase','Mtho2009'};
  comment.Wwp = 'based on 0.01000*Lp^3.04, see F1';
data.Wwi = 28.55;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F1';

data.GSI = 0.05; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'Mtho2009';
  temp.GSI = C2K(15); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_Rf = [ ... % time since birth (yr), length (cm)
0.502	4.270
0.529	3.877
0.531	4.958
0.584	4.024
0.613	4.761
0.750	4.465
0.913	3.580
1.059	7.950
1.082	5.936
1.140	7.606
1.578	6.915
1.635	7.946
1.690	8.093
1.720	9.125
1.937	7.895
1.968	9.909
2.049	8.926
2.187	9.416
2.598	8.971
2.652	8.431
2.680	8.676
2.760	7.840
2.841	6.857
2.873	9.510
2.953	7.839
2.960	11.818
2.982	8.821
2.985	10.442
3.062	7.445
3.611	7.638
3.618	10.978
3.619	11.469
3.645	11.174
3.751	8.865
3.776	7.931
3.780	9.602
3.804	8.226
3.916	9.306
3.918	9.994
3.946	10.386
4.002	11.025
4.192	9.893
4.768	9.693
4.793	8.710
4.880	10.773
4.961	10.084
5.128	11.164
5.155	10.869
5.953	12.141
6.035	11.649
12.758	10.472];
data.tL_Rf(:,1) = (data.tL_Rf(:,1) + 0.1) * 365; % convert yr to d
units.tL_Rf = {'d', 'cm'};  label.tL_Rf = {'time since birth','total length','females'};  
temp.tL_Rf = C2K(15);  units.temp.tL_Rf = 'K'; label.temp.tL_Rf = 'temperature';
bibkey.tL_Rf = 'Mtho2009'; comment.tL_Rf = 'data from Rondegat';
%
data.tL_Rm = [ ... % time since birth (yr), length (cm)
0.093	5.498
0.391	4.185
0.609	3.858
0.637	4.188
0.833	6.680
0.858	5.364
0.975	9.171
1.600	7.016
1.681	6.594
1.794	8.380
1.928	7.019
1.959	8.805
2.533	9.093
2.587	8.576
2.887	8.438
3.109	9.803
3.545	9.056
3.628	9.714
3.630	10.607
3.789	8.166
3.847	9.811
3.873	9.059
3.875	10.234
3.901	9.388
4.011	9.718
4.862	11.183
4.887	10.291
4.996	9.869
5.026	11.185
5.054	11.890
5.599	10.862
5.874	11.569
5.957	11.805
6.147	11.384
6.503	11.716
6.584	11.247
6.694	11.202
6.695	11.953
6.696	12.188];
data.tL_Rm(:,1) = (data.tL_Rm(:,1) + 0.1) * 365; % convert yr to d
units.tL_Rm = {'d', 'cm'};  label.tL_Rm = {'time since birth','total length','males'};  
temp.tL_Rm = C2K(15);  units.temp.tL_Rm = 'K'; label.temp.tL_Rm = 'temperature';
bibkey.tL_Rm = 'Mtho2009';  comment.tL_Rm = 'data from Rondegat';
%
data.tL_Nf = [ ... % time since birth (yr), length (cm)
0.617	3.572
0.803	4.045
1.920	6.457
2.584	7.449
2.797	8.266
2.825	9.041
3.009	8.353
3.623	10.807
3.645	8.656
3.670	8.140
3.672	8.914
3.700	9.474
3.936	8.657
3.965	9.689
4.148	8.916
4.625	9.218
4.841	10.896
4.864	9.520
4.941	8.402
5.921	8.792
6.796	9.612];
data.tL_Nf(:,1) = (data.tL_Nf(:,1) + 0.1) * 365; % convert yr to d
units.tL_Nf = {'d', 'cm'};  label.tL_Nf = {'time since birth','total length','females'};  
temp.tL_Nf = C2K(15);  units.temp.tL_Nf = 'K'; label.temp.tL_Nf = 'temperature';
bibkey.tL_Nf = 'Mtho2009'; comment.tL_Nf = 'data from Noordhoek';
%
data.tL_Nm = [ ... % time since birth (yr), length (cm)
0.553	4.134
0.943	4.488
2.482	8.631
2.533	8.242
2.609	7.814
3.051	8.363
3.521	9.770
4.089	8.645
4.116	9.034
4.507	10.090
4.555	8.259
4.556	8.726
5.775	9.243
9.590	10.639];
data.tL_Nm(:,1) = (data.tL_Nm(:,1) + 0.1) * 365; % convert yr to d
units.tL_Nm = {'d', 'cm'};  label.tL_Nm = {'time since birth','total length','males'};  
temp.tL_Nm = C2K(15);  units.temp.tL_Nm = 'K'; label.temp.tL_Nm = 'temperature';
bibkey.tL_Nm = 'Mtho2009';  comment.tL_Nm = 'data from Noordhoek';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Rf = weights.tL_Rf * 2;
weights.tL_Rm = weights.tL_Rm * 2;
weights.tL_Nf = weights.tL_Nf * 2;
weights.tL_Nm = weights.tL_Nm * 2;
weights.ab = weights.ab * 0;
weights.Li = weights.Li * 8;
weights.GSI = weights.GSI * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Rf','tL_Rm'}; subtitle1 = {'Data for females, males from Rondegat'};
set2 = {'tL_Nf','tL_Nm'}; subtitle2 = {'Data for females, males from Noordhoek'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'JWMW'; % Cat of Life
metaData.links.id_ITIS = '680895'; % ITIS
metaData.links.id_EoL = '204568'; % Ency of Life
metaData.links.id_Wiki = 'Austroglanis_gilli'; % Wikipedia
metaData.links.id_ADW = 'Austroglanis_gilli'; % ADW
metaData.links.id_Taxo = '162711'; % Taxonomicon
metaData.links.id_WoRMS = '1014634'; % WoRMS
metaData.links.id_fishbase = 'Austroglanis-gilli'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Austroglanis_gilli}}';  
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
bibkey = 'Mtho2009'; type = 'phdthesis'; bib = [ ...
'author = {Vsi Gedla Mthombeni}, ' ...
'year = {2009}, ' ...
'title = {The biology of \emph{Austroglanis gilli} and \emph{Austroglanis barnardi} ({S}iluriformes: {A}ustroglanididae) in the {O}lifants {R}iver system, {S}outh {A}frica}, ' ... 
'journal = {International Journal of Molecular Sciences}, ' ...
'school = {Rhodes University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Austroglanis-gilli.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

