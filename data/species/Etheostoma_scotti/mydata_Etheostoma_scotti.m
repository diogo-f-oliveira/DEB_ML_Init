  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_scotti
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_scotti'; 
metaData.species_en = 'Cherokee darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 09 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.am = 2*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'BartPowe2010';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.8;  units.Lp = 'cm'; label.Lp = 'std length at puberty';      bibkey.Lp = 'BartPowe2010'; 
  comment.Lp = 'based on tp = 1 yr and tL data';
data.Li = 4.5;    units.Li = 'cm'; label.Li = 'ultimate std length';      bibkey.Li = 'fishbase';

data.Wwb = 9e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BartPowe2010';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwi = 1.04; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.00513*(Li/0.83)^3.14 (see F1,F2)';

data.Ri = 256/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate at sSL 3.33 cm'; bibkey.Ri = 'BartPowe2010';
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
0.090	2.753
0.091	2.947
0.092	2.521
0.092	2.842
0.092	2.879
0.173	2.700
0.176	2.947
0.177	2.768
0.178	2.826
0.253	2.979
0.253	3.021
0.254	2.753
0.254	2.837
0.254	3.068
0.256	2.658
0.256	2.889
0.337	3.263
0.337	3.316
0.338	3.000
0.338	3.042
0.338	3.100
0.338	3.232
0.415	3.337
0.415	3.495
0.417	3.389
0.417	3.521
0.418	3.547
0.418	3.584
0.419	3.047
0.419	3.232
0.419	3.437
0.419	3.468
0.420	3.658
0.420	3.679
0.420	3.711
0.496	3.474
0.496	3.500
0.497	3.453
0.497	3.742
0.497	3.937
0.499	3.437
0.500	3.389
0.500	3.558
0.500	3.600
0.500	3.637
0.500	3.679
0.581	3.684
0.581	3.858
0.581	4.053
0.581	4.263
0.582	3.468
0.582	3.589
0.662	3.789
0.663	3.542
0.663	3.584
0.663	3.626
0.663	3.895
0.663	3.947
0.664	3.647
0.664	3.737
0.665	3.679
0.665	3.716
0.742	4.095
0.744	3.753
0.744	3.784
0.744	3.826
0.744	3.900
0.745	3.711
0.745	4.137
0.746	4.042
0.746	4.247
0.749	4.016
0.823	4.021
0.826	4.084
0.827	3.858
0.828	3.679
0.907	3.921
0.907	3.942
0.907	3.979
0.907	4.042
0.908	3.879
0.910	3.837
0.910	4.142
0.910	4.205
0.912	4.105
1.009	3.511
1.009	3.721
1.009	3.816
1.009	3.874
1.010	3.916
1.010	3.974
1.010	4.000
1.010	4.026
1.010	4.137
1.010	4.174
1.093	3.947
1.093	4.600
1.095	4.021
1.095	4.047
1.095	4.089
1.095	4.495
1.173	4.211
1.173	4.547
1.174	4.300];
data.tL_f(:,1) = 365 * (0.2 + data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BartPowe2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
0.249	3.552
0.250	3.363
0.250	3.525
0.251	3.196
0.251	3.223
0.251	3.266
0.252	3.649
0.253	2.975
0.253	3.504
0.331	3.093
0.331	3.120
0.333	3.498
0.334	3.271
0.334	3.363
0.334	3.411
0.334	3.433
0.334	3.541
0.337	3.665
0.415	3.799
0.415	3.902
0.415	4.015
0.419	4.269
0.498	4.333
0.499	3.999
0.499	4.279
0.499	4.533
0.500	3.864
0.580	3.237
0.580	4.527
0.581	3.621
0.581	4.074
0.581	4.122
0.581	4.155
0.581	4.209
0.584	4.392
0.584	4.624
0.660	4.532
0.663	4.278
0.663	4.359
0.663	4.494
0.663	4.634
0.666	3.750
0.744	4.699
0.747	4.208
0.747	4.289
0.830	4.569
0.911	4.741
0.912	4.234
0.914	4.380
0.914	4.898
1.001	4.487
1.002	4.546
1.002	4.579
1.005	4.250
1.005	4.304
1.005	4.352
1.006	4.714
1.007	3.974
1.007	4.654
1.008	4.897
1.083	4.330
1.172	4.799];
data.tL_m(:,1) = 365 * (0.2 + data.tL_m(:,1));  % convert rt to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end;
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BartPowe2010';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  5 * weights.tL_f;
weights.tL_m =  5 * weights.tL_m;
weights.Wwb =  5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v =  2 * weights.psd.v;
%weights.psd.p_M =  3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  


%% Facts
F1 = 'length-weight: Ww in g = 0.00513 * (TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.83 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3BL6Q'; % Cat of Life
metaData.links.id_ITIS = '553382'; % ITIS
metaData.links.id_EoL = '219414'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_scotti'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_scotti'; % ADW
metaData.links.id_Taxo = '690870'; % Taxonomicon
metaData.links.id_WoRMS = '1010784'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-scotti'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_scotti}}';  
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
bibkey = 'BartPowe2010'; type = 'article'; bib = [ ... 
'doi = {10.1656/058.009.0404}, ' ...
'author = {Stephanie D. Barton and Steven L. Powers}, ' ...
'year = {2010}, ' ...
'title = {Life-History Aspects of the {C}herokee Darter, \emph{Etheostoma scotti} ({A}ctinopterygii: {P}ercidae), an Imperiled Species in {N}orthern {G}eorgia}, ' ... 
'journal = {Southeastern Naturalist}, ' ...
'volume = {9(4)}, '...
'pages = {687-698}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-scotti.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
