function [data, auxData, metaData, txtData, weights] = mydata_Aegopinella_epipedostoma
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Gastrodontidae';
metaData.species    = 'Aegopinella_epipedostoma'; 
metaData.species_en = 'Glass snail'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Thl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biSi'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 19]; 

%% set data
% zero-variate data

data.ab  = 25;   units.ab  = 'd'; label.ab  = 'age at birth';     bibkey.ab  = 'KuznPokr2012';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '27-41 d ';
data.tp  = 260;   units.tp  = 'd'; label.tp  = 'time since birth at puberty';     bibkey.tp  = 'KuznPokr2012';   
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '220-298 d';
data.am  = 2*365;   units.am  = 'd'; label.am  = 'life span';     bibkey.am  = 'KuznPokr2012';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.16; units.Lb  = 'cm';  label.Lb  = 'shell breath at birth';   bibkey.Lb  = 'KuznPokr2012';
data.Li  = 1.1; units.Li  = 'cm';  label.Li  = 'ultimate shell breath';   bibkey.Li  = 'Jans2015';
  comment.Li = 'values for A.nitens, which is very similar';

data.Wdi  = 0.025; units.Wdi  = 'g';  label.Wdi  = 'ultimate wet weight';   bibkey.Wdi  = 'Will1976';
  comment.Wdi = 'based on size-corrected value for Cepaea nemoralis: (1.1/2.2)^3*0.2';

data.Ri  = 20/365;   units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';     bibkey.Ri  = 'KuznPokr2012';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '9-26 eggs per clutch, 1 to 4 clutch per life time';
 
% uni-variate data
% time - length
data.tL = [ ... % time since 1 April 1972 (d), number of whorls (#)
0	1.526
0	1.559
0	1.642
0	1.758
7	1.924
7	1.991
7	1.659
7	1.684
7	1.875
14	2.141
14	1.885
14	1.992
14	2.050
14	2.100
19.150	1.911
19.150	2.068
19.150	2.118
20.000	2.168
20.000	2.284
34.446	2.218
36.145	2.426
36.995	2.343
49.741	2.559
51.441	2.285
51.441	2.443
59.938	2.609
59.938	2.717
61.638	2.568
62.488	2.477
76.934	2.726
76.934	2.784
76.934	2.900
78.633	2.585
78.633	2.676
91.379	2.909
93.079	2.768
93.079	2.851
104.126	3.067
104.126	3.340
107.525	2.968
107.525	3.017
110.074	2.910
127.069	3.466
127.919	3.375
129.618	3.151
129.618	3.209
129.618	3.242
131.318	3.052
149.163	3.508
151.712	3.426
154.261	3.351
155.961	3.202
155.961	3.244
155.961	3.542
157.660	3.592
173.805	3.468
173.805	3.526
189.101	3.444
190.800	3.751
192.500	3.693
194.200	3.635
198.448	3.544
198.448	3.842
201.847	3.793
203.547	3.644
219.692	3.611
221.392	3.777
225.640	3.968
231.589	3.769
235.837	3.794
245.185	3.894
246.034	3.836
252.833	3.828
268.128	3.945
268.128	3.986
280.874	3.913
287.672	3.971
304.667	4.013
304.667	4.063
306.367	3.972
308.916	4.088
328.461	3.989
344.606	4.048
359.901	4.115
362.451	4.074
376.897	3.967
381.995	4.075
397.291	4.076
438.929	4.036
447.426	3.987
462.722	3.996
475.468	4.137
495.012	4.039
520.505	4.106
534.101	4.041
549.397	4.116
585.086	4.035
597.832	4.143
623.325	4.037];
data.tL(:,2) = data.Lb*(data.Li/ data.Lb).^((data.tL(:,2)-data.tL(1,2))/(data.tL(end,2)-data.tL(1,2)));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(21.5);  
units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KuznPokr2012';
comment.tL = 'Based on number of whorls, assuming a constant factor per whorl, given Lb and Li; data from Spring 1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

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
metaData.links.id_CoL = '65965'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4916011'; % Ency of Life
metaData.links.id_Wiki = 'Aegopinella_epipedostoma'; % Wikipedia
metaData.links.id_ADW = ''; % ADW  not present 
metaData.links.id_Taxo = '79681'; % Taxonomicon 
metaData.links.id_WoRMS = '1003476'; % WoRMS
metaData.links.id_molluscabase = '1003476'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aegopinella_epipedostoma}}';
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
bibkey = 'KuznPokr2012'; type = 'Article'; bib = [ ... 
'author = {El\dot{z}bieta Ku\''{z}nik-Kowalska and Beata M. Pokryszko and Ma{\l}gorzata Pro\''{c}k\''{o}w}, ' ... 
'title = {CONTRIBUTION TO knowledge of THE Life cycle of \emph{Aegopinella epipedostoma} ({F}agot 1879) ({G}astropoda: {P}ulmonata: {Z}onitidae) in the laboratory}, ' ...
'journal = {Journal of Conchology}, ' ...
'volume = {41}, ' ...
'year = {2012}, ' ...
'pages = {115-118}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jans2015'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Bert Jansen}, ' ...
'year = {2015}, ' ...
'title  = {Veldgids Slakken en Mossels}, ' ...
'publisher = {KNNV}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Will1976'; type = 'Article'; bib = [ ... 
'author = {Phillip Williampson}, ' ... 
'title = {Size-weight relationships and field growth rates of the landsnail \emph{Cepaea nemoralis} {L}.}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'number = {3}, ' ...
'volume = {45}, ' ...
'year = {1976}, ' ...
'pages = {875-885}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

