function [data, auxData, metaData, txtData, weights] = mydata_Raja_clavata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Raja_clavata'; 
metaData.species_en = 'Thornback ray'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 06];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 18]; 

%% set data
% zero-variate data;
data.ab = 5*30.5;units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'ADW';    
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps for all data are guessed';
data.ap = 3650;  units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'AnAge';
  % ADW 8.8 yr = 3200 d
  temp.ap = C2K(12); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 23*365; units.am = 'd';    label.am = 'life span';             bibkey.am = 'Anage';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 12;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'ADW';
data.Li  = 100;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Wiki';

data.Wwb = 8.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ADW';
 % Wiki 2-4 kg
data.Wwi = 9900; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Anage';
 % fishbase: 14300 g
 
data.Ri  = 142/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.551	31.477
1.818	32.666
2.100	38.855
2.831	42.158
3.026	43.346
3.276	44.930
3.559	48.356
3.791	49.282
4.059	49.155
4.272	51.922
4.539	53.638
4.823	56.933
5.055	56.806
5.305	57.863
5.515	64.051
5.823	58.136
6.034	63.008
6.300	65.645
6.567	68.018
6.836	67.365
7.103	68.949
7.264	67.768
7.476	71.325
7.818	69.226
8.065	73.178
8.387	73.184
8.599	77.004
8.816	73.587
9.117	77.277
9.349	78.334
9.547	76.758
9.779	76.894
10.084	75.058
10.812	82.703
11.351	78.371
11.563	82.717
13.547	83.018];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length'};
temp.tL_m = C2K(12);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Hold1972';
comment.tL_m = 'Data for males';
%
data.tL_f = [ ... % time since birth (yr), length (cm)
2.033	31.617
2.245	36.358
2.602	36.628
2.725	39.525
2.867	41.764
3.118	39.927
3.242	41.377
3.564	41.646
3.758	45.860
4.328	48.766
4.844	51.275
4.986	53.646
5.253	54.441
5.520	56.551
6.054	60.509
6.375	60.778
6.837	65.655
7.604	68.301
7.815	72.384
8.579	79.109
8.830	78.061
9.274	82.411
9.844	85.317
10.039	88.741
10.325	88.747
10.521	89.671
10.825	88.756
10.989	85.207
11.271	90.870
11.772	89.432
12.033	100.621
12.291	89.310
12.594	90.631
13.039	94.061
13.325	93.935
13.544	86.834];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length'};  
temp.tL_f = C2K(12); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Hold1972';
comment.tL_f = 'Data for females';

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

%% Discussion points
D1 = 'Males are assumed not to differ from females (energetically)';
metaData.discussion = struct('D1', D1);

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '793MV'; % Cat of Life
metaData.links.id_ITIS = '160901'; % ITIS
metaData.links.id_EoL = '46560547'; % Ency of Life
metaData.links.id_Wiki = 'Raja_clavata'; % Wikipedia
metaData.links.id_ADW = 'Raja_clavata'; % ADW
metaData.links.id_Taxo = '108279'; % Taxonomicon
metaData.links.id_WoRMS = '105883'; % WoRMS
metaData.links.id_fishbase = 'Raja-clavata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Raja_(genus)}}';   
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
bibkey = 'Hold1972'; type = 'Article'; bib = [ ...  
'author = {M. J. Holden}, ' ...
'year = {1972}, ' ...
'title  = {The growth rates of \emph{Raja brachyura}, \emph{R. clavata} and \emph{R. montaqui} as determined from tagging data}, ' ...
'journal = {J. Physiol. (Lond.)}, ' ...
'volume = {34}, ' ...
'pages = {161--168}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Raja_clavata}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Raja_clavata/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
