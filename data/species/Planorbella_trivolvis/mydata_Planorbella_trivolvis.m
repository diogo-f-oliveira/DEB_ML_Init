function [data, auxData, metaData, txtData, weights] = mydata_Planorbella_trivolvis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Planorbidae';
metaData.species    = 'Planorbella_trivolvis'; 
metaData.species_en = 'Marsh ramshorn'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'Lb'; 'Lj'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-S'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 28]; 

%% set data
% zero-variate data

data.Lb  = 0.15; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';
  comment.Lb = 'value for Planorbarius corneus';
data.Lp  = 1.17; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'NortNewm2015';
data.Li  = 2.40; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'NortNewm2015';

data.Wwi  = 10; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'value for Planorbarius corneus: 1.6*(2.4/1.3)^3';

data.Ri  = 500/21;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'NortNewm2015';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time - length
data.tL = [ ... % age (wk), total length (cm)
69.811	0.463
77.305	0.635
83.909	0.766
91.234	0.867
98.380	0.966
105.173	1.028
112.505	1.086
119.482	1.119
133.973	1.185
140.235	1.212
147.750	1.237
155.083	1.283
162.239	1.314
169.041	1.325
173.317	1.328
188.725	1.360
202.073	1.394
215.429	1.419
229.253	1.489
243.614	1.540
258.500	1.578
272.884	1.606
287.263	1.637
301.134	1.662
314.989	1.703
328.846	1.742
342.196	1.774
356.072	1.794
369.955	1.808
384.863	1.826
398.217	1.853
412.615	1.867
434.183	1.915
455.256	1.944
475.821	1.967
497.387	1.992
517.289	2.018
536.513	2.029
560.372	2.038
581.608	2.072
602.150	2.077
623.371	2.098
642.584	2.099
670.441	2.129
690.952	2.106
714.824	2.128
734.055	2.145
755.298	2.186
775.848	2.198
797.119	2.263
825.657	2.311
854.161	2.327
882.678	2.355];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell diameter'};  
temp.tL    = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NortNewm2015';

% time - survival
data.tS = [ ... % time since birth (d), fraction surviving (-)
    273.477	1.000
277.301	1.000
391.690	0.960
397.449	0.930
517.581	0.884
519.582	0.916
529.204	0.878
530.938	0.772
567.769	0.766
571.589	0.737
608.276	0.657
610.358	0.731
629.602	0.655
633.414	0.621
666.301	0.581
672.187	0.617
681.736	0.541
685.691	0.581
687.483	0.505
689.496	0.543
693.142	0.423
697.186	0.509
702.767	0.387
704.784	0.427
710.458	0.353
714.402	0.387
727.840	0.317
727.909	0.353
749.076	0.269
749.154	0.309
783.898	0.228
787.854	0.267
797.417	0.200
812.845	0.156
814.861	0.196
863.194	0.122
863.249	0.150
872.890	0.122
878.637	0.086
1115.129	0.048
1117.107	0.068
1124.754	0.012
1124.816	0.000];
units.tS   = {'d', 'cm'};  label.tS = {'time since birth', 'fraction surviving'};  
temp.tS    = C2K(22);  units.temp.tS = 'K'; label.temp.tS = 'temperature';
bibkey.tS = 'NortNewm2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4JKLS'; % Cat of Life
metaData.links.id_ITIS = '76671'; % ITIS
metaData.links.id_EoL = '452883'; % Ency of Life
metaData.links.id_Wiki = 'Planorbella_trivolvis'; % Wikipedia
metaData.links.id_ADW = 'Planorbella_trivolvis'; % ADW
metaData.links.id_Taxo = '912456'; % Taxonomicon
metaData.links.id_WoRMS = '593137'; % WoRMS
metaData.links.id_molluscabase = '593137'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Planorbella_trivolvis}}';
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
bibkey = 'NortNewm2015'; type = 'Article'; bib = [ ... 
'doi = {10.1093/mollus/eyv050}, ' ...
'author = {Cynthia G. Norton and Bridget R. Newman}, ' ... 
'title = {Growth, reproduction and longevity in the hermaphroditic freshwater snail \emph{Helisoma trivolvis}}, ' ...
'journal = {Journal of Molluscan Studies}, ' ...
'number = {6}, ' ...
'volume = {49}, ' ...
'year = {2015}, ' ...
'pages = {1-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
