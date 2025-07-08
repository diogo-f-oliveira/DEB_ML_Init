function [data, auxData, metaData, txtData, weights] = mydata_Parma_microlepis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Parma_microlepis'; 
metaData.species_en = 'White-ear scalyfin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi','biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 23];

%% set data
% zero-variate data

data.ab = 22.5;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(18.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 38*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'TzioKing1999';   
  temp.am = C2K(18.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 14;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.9e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 2.5 mm and egg diameter (guessed) 1.5 mm: pi/6*0.25*0.15^2';
data.Wwp = 4.2;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on Wwp = 0.01950*Lp^3.00, see F1';
data.Wwi = 53.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Wwi = 0.01950*Li^3.00, see F1';

data.Ri  = 95; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time (d), standard length (cm)
0.762	4.972
0.793	8.863
0.797	9.254
0.818	4.932
0.835	6.966
0.848	8.550
0.877	5.128
0.923	3.837
0.938	5.695
0.954	7.709
0.997	5.969
1.106	5.402
1.605	10.954
1.641	8.413
1.711	10.016
1.723	11.561
1.812	8.530
1.813	8.667
1.828	10.524
1.866	8.217
1.871	8.843
1.879	9.801
1.914	7.181
1.917	7.454
1.922	8.158
1.981	8.393
1.986	8.979
2.663	8.588
2.679	10.465
2.684	11.130
2.784	9.448
2.787	9.878
2.793	10.621
2.832	8.334
2.852	10.797
2.892	8.744
2.902	10.015
2.912	11.228
2.943	8.079
2.944	8.197
2.946	8.490
2.956	9.663
2.973	11.834
3.036	12.577
3.076	10.524
3.707	11.364
3.829	12.342
3.874	10.953
3.935	11.520
4.794	12.400
5.824	13.475
6.832	11.851
6.833	11.969
6.838	12.653
7.013	13.181
7.682	11.734
7.753	13.493
7.807	13.180
7.808	13.298
7.809	13.454
7.868	13.650
8.835	14.060
9.847	12.886
9.855	13.805
10.760	13.492
10.768	14.509
11.780	13.374
12.910	12.728
14.734	13.803
21.994	13.545
27.954	13.757
32.943	13.344
36.976	13.909];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'females'};  
temp.tL_f    = C2K(18.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TzioKing1999';
%
data.tL_m = [ ... % time (d), standard length (cm)
2.598	14.493
3.664	13.085
4.620	12.009
4.735	12.107
4.736	12.243
4.742	12.967
5.877	13.005
5.983	12.086
6.674	13.416
6.947	12.105
7.862	12.946
7.915	12.476
8.661	13.552
8.771	13.082
9.800	14.059
11.733	14.528
11.832	12.807
12.855	13.002
14.730	13.236
14.785	13.021
19.839	13.644
20.911	12.920
24.723	14.169
32.893	14.205];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'males'};  
temp.tL_m    = C2K(18.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TzioKing1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight:  Ww in g = 0.01950*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6TRMB'; % Cat of Life
metaData.links.id_ITIS = '170213'; % ITIS
metaData.links.id_EoL = '46572610'; % Ency of Life
metaData.links.id_Wiki = 'Parma_microlepis'; % Wikipedia
metaData.links.id_ADW = 'Parma_microlepis'; % ADW
metaData.links.id_Taxo = '183230'; % Taxonomicon
metaData.links.id_WoRMS = '282156'; % WoRMS
metaData.links.id_fishbase = 'Parma-microlepis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parma_microlepis}}';
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
bibkey = 'TzioKing1999'; type = 'article'; bib = [ ... 
'doi = {10.2307/1447480}, ' ...
'author = {Tzioumis, Vicky and Kingsford, Michael J.}, ' ... 
'year = {1999}, ' ...
'title = {Reproductive Biology and Growth of the Temperate Damselfish \emph{Parma microlepis}}, ' ...
'journal = {Copeia}, ' ...
'volume = {1999(2)}, '...
'pages = {348-361}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Parma-microlepis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
