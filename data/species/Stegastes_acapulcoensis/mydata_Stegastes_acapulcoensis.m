function [data, auxData, metaData, txtData, weights] = mydata_Stegastes_acapulcoensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Stegastes_acapulcoensis'; 
metaData.species_en = 'Acapulco major'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 22];

%% set data
% zero-variate data

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(26.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 32*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(26.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 17;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 2.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.02089*Lp^2.98, see F1';
data.Wwi = 97;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^2.98, see F1';

data.Ri  = 200; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chromis chromis';
  
% uni-variate data
% time-length
data.tL_G = [ ... % time (d), standard length (cm)
1.145	9.626
1.782	10.090
1.782	10.284
1.845	10.515
1.909	8.621
1.909	8.389
1.973	10.902
2.227	11.405
2.864	11.289
2.864	9.510
2.927	10.438
2.927	9.974
3.055	10.709
3.182	10.979
3.182	9.162
3.818	12.332
4.009	10.322
4.009	10.593
4.073	11.095
4.073	11.443
4.073	11.714
4.900	11.907
5.091	11.443
5.855	12.719
5.982	10.902
5.982	11.830
6.045	11.173
6.045	12.101
6.109	11.327
6.809	13.144
6.873	12.410
6.873	11.675
7.000	11.405
7.891	12.332
7.955	13.299
8.018	11.095
8.018	11.791
8.018	12.023
8.845	11.946
8.909	11.405
9.800	11.598
9.927	12.216
9.991	13.106
10.691	12.101
10.818	11.598
10.818	11.791
10.818	12.487
11.836	12.642
11.836	12.332
11.836	12.062
11.836	11.598
11.836	11.366
13.936	12.371
14.000	12.680
14.127	12.990
14.955	12.410
22.845	11.598
22.909	13.106
22.973	12.371
23.036	11.869
23.036	11.405
32.009	13.840];
data.tL_G(:,1) = 365 * (0.5 + data.tL_G(:,1)); % convert yr to d
for i=2:size(data.tL_G,1); if data.tL_G(i,1)<=data.tL_G(i-1,1); data.tL_G(i,1)=data.tL_G(i-1,1)+1e-3;end;end
units.tL_G   = {'d', 'cm'};  label.tL_G = {'time since birth', 'standard length', 'Galapagos'};  
temp.tL_G    = C2K(26.2);  units.temp.tL_G = 'K'; label.temp.tL_G = 'temperature';
bibkey.tL_G = 'MeekAcke2001';
%
data.tL_P = [ ... % time (d), standard length (cm)
0.971	8.789
0.974	6.535
0.991	10.071
0.991	9.605
1.012	10.421
1.036	9.333
1.058	9.217
1.930	10.855
1.930	10.699
1.931	10.155
1.931	9.806
1.931	9.572
1.954	9.184
1.993	12.060
1.994	11.555
1.996	10.428
2.017	11.127
2.956	11.639
2.956	11.133
2.958	10.356
2.959	9.696
2.959	9.540
2.959	9.462
2.978	11.328
2.979	10.823
2.979	10.628
2.980	10.162
3.021	11.989
3.024	10.007
3.897	10.518
3.898	9.935
3.939	11.878
3.939	11.567
3.960	12.617
3.962	11.373
3.962	11.218
3.962	10.907
3.963	10.207
3.964	9.547
3.982	12.228
3.982	12.034
4.946	10.758
4.947	10.097
4.968	10.602
4.968	10.369
5.010	12.118
5.011	11.224
5.011	10.991
5.076	11.885
5.076	11.536
5.907	11.619
5.928	12.202
5.930	10.298
5.951	11.347
5.972	11.969
5.973	10.998
5.995	10.726
6.911	12.480
6.911	12.169
6.934	11.353
6.935	11.159
6.954	12.675
6.956	11.781
6.957	10.887
7.961	11.710
7.984	11.011
8.027	11.399
8.029	10.234
8.945	11.677
8.946	10.667
8.965	12.610
8.990	10.356
9.993	12.617
10.014	13.161
10.017	10.985
10.038	11.529
10.932	12.817
11.000	11.496
11.021	11.730
11.982	12.591];
data.tL_P(:,1) = 365 * (0.5 + data.tL_P(:,1)); % convert yr to d
for i=2:size(data.tL_P,1); if data.tL_P(i,1)<=data.tL_P(i-1,1); data.tL_P(i,1)=data.tL_P(i-1,1)+1e-3;end;end
units.tL_P   = {'d', 'cm'};  label.tL_P = {'time since birth', 'standard length', 'Panama'};  
temp.tL_P    = C2K(26.2);  units.temp.tL_P = 'K'; label.temp.tL_P = 'temperature';
bibkey.tL_P = 'MeekAcke2001';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_G = 5 * weights.tL_G;
weights.tL_P = 5 * weights.tL_P;
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
set1 = {'tL_G','tL_P'}; subtitle1 = {'Data from Galapagos, Panama'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02089*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4ZNMK'; % Cat of Life
metaData.links.id_ITIS = '615329'; % ITIS
metaData.links.id_EoL = '46572322'; % Ency of Life
metaData.links.id_Wiki = 'Stegastes_acapulcoensis'; % Wikipedia
metaData.links.id_ADW = 'Stegastes_acapulcoensis'; % ADW
metaData.links.id_Taxo = '188061'; % Taxonomicon
metaData.links.id_WoRMS = '276658'; % WoRMS
metaData.links.id_fishbase = 'Stegastes-acapulcoensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stegastes_acapulcoensis}}';
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
bibkey = 'MeekAcke2001'; type = 'Article'; bib = [ ... 
'doi = {10.3354/MEPS212223}, ' ...
'author = {M. G. Meekan and J. L. Ackerman and G. M. Wellington}, ' ... 
'year = {2001}, ' ...
'title = {Demography and age structures of coral reef damselfishes in the tropical eastern {P}acific {O}cean}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {212}, ' ...
'pages = {223–232}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Stegastes-acapulcoensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
