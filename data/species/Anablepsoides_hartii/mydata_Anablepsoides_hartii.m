  function [data, auxData, metaData, txtData, weights] = mydata_Anablepsoides_hartii
  %% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Rivulidae';
metaData.species    = 'Anablepsoides_hartii'; 
metaData.species_en = 'Giant Rivulus'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-r'}; 

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 01];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU Univ. Amsterdam'};      

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc    = [2020 10 01]; 

%% set data
% zero-variate data
data.am = 3*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'itrainsfishes';
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb  = 0.65;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'FurnRezn2014';  
data.Lp = 3.5;     units.Lp = 'cm';     label.Lp = 'ultimate total length';  bibkey.Lp = 'FurnRezn2014';
data.Li = 10;      units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'FurnRezn2014';

data.Wwb = 2.1e-3; units.Wwb = 'g';  label.Wwb = 'wet weight at puberty';  bibkey.Wwb = 'itrainsfishes';
  comment.Wwb = 'based on egg diameter of 1.6 mm: pi/6*0.16^3';
data.Wwp = 0.56; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'FurnRezn2014';
  comment.Wwp = 'based on 0.01330*Lp^2.984, see F1';
data.Wwi = 12.8; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'FurnRezn2014';
  comment.Wwi = 'based on 0.01330*Li^2.984, see F1';
   
data.Ri = 5;  units.Ri = '#/d'; label.Ri = 'max reprod rate';   bibkey.Ri = 'itrainsfishes';
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '5 - 15 eggs per day; which seems much as average over 2 .5 yrs';
  
% uni-variate data
  
% length - spec growth rate
data.Lr = [ ... % total length (cm). spec growth rate (1/d)
1.151	0.026
1.179	0.036
1.188	0.020
1.240	0.026
1.245	0.046
1.266	0.028
1.304	0.027
1.318	0.031
1.328	0.023
1.338	0.012
1.352	0.016
1.367	0.026
1.367	0.028
1.378	0.021
1.381	0.032
1.405	0.028
1.414	0.013
1.430	0.025
1.444	0.029
1.455	0.022
1.459	0.039
1.468	0.024
1.471	0.035
1.506	0.023
1.507	0.028
1.508	0.030
1.508	0.031
1.534	0.033
1.543	0.021
1.544	0.025
1.548	0.039
1.580	0.015
1.580	0.016
1.583	0.026
1.583	0.028
1.623	0.035
1.700	0.039
1.709	0.024
1.712	0.034
1.732	0.015
1.734	0.021
1.747	0.022
1.784	0.017
1.797	0.020
1.834	0.015
1.847	0.019
1.871	0.014
1.886	0.020
1.898	0.019
1.912	0.025
1.923	0.017
1.937	0.021
1.976	0.025
1.976	0.027
1.986	0.014
2.027	0.028
2.075	0.017
2.088	0.015
2.125	0.013
2.201	0.014
2.278	0.017
2.302	0.011
2.302	0.012
2.315	0.013
2.377	0.007
2.378	0.011
2.381	0.022
2.442	0.010
2.454	0.008
2.531	0.010
2.543	0.009
2.631	0.007
2.631	0.007
2.682	0.008
2.707	0.005
2.771	0.008
2.808	0.005
2.822	0.007
2.822	0.007
2.873	0.008
2.962	0.009
2.974	0.006
2.999	0.006
3.049	0.005
3.050	0.005
3.088	0.006
3.126	0.008
3.138	0.004
3.138	0.005
3.163	0.002
3.202	0.006
3.252	0.004
3.315	0.003
3.354	0.007
3.355	0.009
3.380	0.006
3.442	0.002
3.443	0.004
3.493	0.003
3.494	0.007
3.518	0.002
3.595	0.004
3.621	0.006
3.633	0.003
3.671	0.004
3.672	0.009
3.709	0.005
3.722	0.003
3.734	0.002
3.747	0.002
3.773	0.007
3.798	0.004
3.926	0.007
3.949	0.001
3.962	0.002
3.975	0.003
4.026	0.004
4.039	0.002
4.039	0.003
4.065	0.006
4.077	0.004
4.127	0.002
4.141	0.005
4.166	0.006
4.178	0.003
4.204	0.005
4.216	0.001
4.216	0.002
4.267	0.003
4.268	0.005
4.294	0.007
4.305	0.002
4.356	0.003
4.381	0.001
4.395	0.005
4.445	0.003
4.457	0.002
4.482	-0.001
4.495	0.001
4.496	0.003
4.509	0.004
4.547	0.004
4.635	0.002
4.635	0.003
4.660	0.002
4.736	0.000
4.762	0.004
4.775	0.003
4.787	0.001
4.838	0.004
4.889	0.003
4.902	0.006
4.990	0.002
4.991	0.004
5.003	0.001
5.054	0.003
5.054	0.004
5.067	0.005
5.129	0.000
5.130	0.001
5.130	0.002
5.130	0.003
5.181	0.002
5.219	0.002
5.270	0.006
5.359	0.003
5.485	0.002
5.537	0.006
5.549	0.003
5.561	0.002
5.625	0.001
5.625	0.004
5.638	0.002
5.701	0.001
5.828	0.002
5.969	0.009
6.082	0.003
6.171	0.004
6.209	0.002
6.222	0.005
6.259	0.001
6.297	0.002
6.412	0.002
6.424	0.001
6.501	0.003
6.602	0.004
6.640	0.003
6.703	0.002
6.881	0.002
6.957	0.003
7.046	0.003
7.148	0.002
7.211	0.000
7.262	0.002
7.466	0.007
7.668	0.003
7.731	0.001
7.858	0.000
7.972	-0.002
8.340	0.000
8.353	0.001
8.391	-0.001
8.467	0.000
8.696	0.002
8.835	0.000
9.901	0.002];
units.Lr = {'cm', '1/d'}; label.Lr = {'total length', 'spec growth rate'};  
temp.Lr = C2K(24);  units.temp.Lr = 'K'; label.temp.Lr = 'temperature';
bibkey.Lr = 'FurnRezn2014';
comment.Lr = 'Sexes combined; FurnRezn2014 give r in g/d, but that must be wrong';

%% set weights for all real data
weights = setweights(data, []);
weights.Lr = 10 * weights.Lr;
weights.Ri = 3 * weights.Ri;
weights.Lb = 3 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'mean temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Discussion points
D1 = 'length-weight: Ww in g = 0.01330 * (TL in cm)^2.984'; 
  metaData.bibkey.D1 = 'fishbase';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '66GGF'; % Cat of Life
metaData.links.id_ITIS = '553288'; % ITIS
metaData.links.id_EoL = '203993'; % Ency of Life
metaData.links.id_Wiki = 'Anablepsoides'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5246530'; % Taxonomicon
metaData.links.id_WoRMS = '1019651'; % WoRMS
metaData.links.id_fishbase = 'Anablepsoides-hartii'; % fishbase


%% References
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Anablepsoides-hartii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Anablepsoides_hartii}}';
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
bibkey = 'FurnRezn2014'; type = 'Article'; bib = [ ...
'author = {Andrew I. Furness and David N. Reznick}, ' ...
'year = {2014}, ' ...
'title = {The comparative ecology of a killifish (\emph{Rivulus hartii}) across aquatic communities differing in predation intensity}, ' ...
'journal = {Evolutionary Ecology Research}, ' ...
'volume = {16}, ' ...
'pages = {249-265}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'itrainsfishes'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.itrainsfishes.net/content/rivulus_hartii_001.php}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

