function [data, auxData, metaData, txtData, weights] = mydata_Siren_lacertina
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Sirenidae';
metaData.species    = 'Siren_lacertina'; 
metaData.species_en = 'Greater siren'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-dL'; 'L-dWw'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 15];


%% set data
% zero-variate data

data.ab = 60;   units.ab = 'd';    label.ab = 'time since birth at birth'; bibkey.ab = 'ADW';
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'all temps are guessed';
data.tp = 2*365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25*365;  units.am = 'd';    label.am = 'life span';                  bibkey.am = 'AnAge';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.6;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Luhr2008'; 
  comment.Lb = '1.3 cm SVL';
data.Lp  = 23.5;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Luhr2008'; 
  comment.Lp = '22 till 25 cm';
data.Li = 97;      units.Li = 'cm'; label.Li = 'ultimate total length';        bibkey.Li  = 'Luhr2008';

data.Wwp = 14.2;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Luhr2008';
  comment.Wwp = 'computed from Wwi*(Lp/Li)^3';
data.Wwi = 1000;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Luhr2008';

data.Ri  = 1400/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Luhr2008';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length data
data.tL = [ ... % time since birth (d), SVL (cm)
  0   1.3
 20   3
168   7.5
365  10
730  20];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'snout-to-vent length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Luhr2008';

% length-change in length
data.LdL = [ ... % SVL (cm), change in SVL (cm/d)
21.777	0.018
22.539	0.011
22.652	0.003
23.108	0.012
23.111	0.011
23.369	0.028
24.245	0.013
24.297	0.000
24.371	0.022
24.545	0.019
24.746	0.010
25.378	0.015
25.760	0.021
26.253	0.020
26.323	0.003
26.654	0.022
26.675	0.017
26.739	0.001
27.079	0.017
27.220	0.003
27.356	0.009
27.707	0.003
28.052	0.019
28.583	0.028
28.626	0.018
28.957	0.017
29.220	0.012
29.912	0.022
30.045	0.010
30.051	0.008
30.207	0.010
30.329	0.020
30.481	0.003
30.736	0.000
30.858	0.030
31.263	0.011
31.950	0.002
32.041	0.000
32.526	0.001
33.078	0.026
33.270	0.019
33.698	0.014
34.523	0.011
34.687	0.031
37.124	0.013
41.236	0.004
41.767	-0.006
44.513	0.000
44.717	-0.010
47.645	-0.008
49.417	-0.003
50.235	-0.004];
units.LdL  = {'cm', 'cm/d'};  label.LdL = {'snout-to-vent length', 'change in SVL'};  
temp.LdL = C2K(18);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Luhr2008';

% length-change in wet weight
data.LdW = [ ... % SVL (cm), change in wet weight (g/d)
21.854	0.216
22.649	0.249
22.653	0.177
23.092	0.244
23.096	0.163
23.514	0.714
24.252	0.023
24.271	-0.399
24.494	0.556
24.594	0.311
24.678	0.412
25.389	0.330
25.816	0.675
26.266	0.503
26.462	0.076
26.522	0.733
26.633	0.210
26.807	0.291
27.166	0.181
27.258	0.100
27.341	0.215
27.965	0.114
28.127	0.450
28.556	0.761
29.013	0.440
29.199	0.234
29.280	0.387
30.168	0.329
30.174	0.195
30.187	-0.098
30.266	0.104
30.268	0.061
30.437	0.253
30.617	0.190
31.033	0.775
31.407	0.320
31.953	-0.016
32.299	0.166
32.395	0.008
33.049	1.207
33.248	0.722
33.625	0.204
34.647	1.096
34.765	0.429
37.101	-0.367
41.161	-0.109
41.653	0.759
44.440	1.785
44.527	1.823
47.872	0.226
49.496	1.516
50.418	0.676];
units.LdW  = {'cm', 'g/d'};  label.LdW = {'snout-to-vent length', 'change in wet weight'};  
temp.LdW = C2K(18);  units.temp.LdW = 'K'; label.temp.LdW = 'temperature';
bibkey.LdW = 'Luhr2008';

% LW data 
LLW = [ ... % SVL (cm), TL (cm), Wet weight (g)
 29.8 44.6 208.8
 27.3 41.8 158.6
 28.6 41.2 224.9];
data.LW_SVL = LLW(:,[1 3]);
units.LW_SVL  = {'cm', 'g'};  label.LW_SVL = {'length', 'wet weight', 'SVL'};  
bibkey.LW_SVL = 'Luhr2008';
comment.LW_SVL = 'Data for SVL';
%
data.LW_TL = LLW(:,[2 3]);
units.LW_TL  = {'cm', 'g'};  label.LW_TL = {'length', 'wet weight', 'TL'};  
bibkey.LW_TL = 'Luhr2008';
comment.LW_TL = 'Data for TL';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.LdW = 0 * weights.LdW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_SVL','LW_TL'}; subtitle1 = {'Data for SVL, TL'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Enters a state of aestivation in stream of lake mud to avoid dessication';
metaData.bibkey.F1 = 'ADW'; 
F2 = 'Non-aestivating animals are capable of long-term (2.2-5.2 years) persistence without feeding and can survive losses of 45-86% percent of their body mass; have large fat reserves in their tails';
metaData.bibkey.F2 = 'Luhr2008'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4XR2K'; % Cat of Life
metaData.links.id_ITIS = '173735'; % ITIS
metaData.links.id_EoL = '331129'; % Ency of Life
metaData.links.id_Wiki = 'Siren_lacertina'; % Wikipedia
metaData.links.id_ADW = 'Siren_lacertina'; % ADW
metaData.links.id_Taxo = '47263'; % Taxonomicon
metaData.links.id_WoRMS = '1506619'; % WoRMS
metaData.links.id_amphweb = 'Siren+lacertina'; % AmphibiaWeb
metaData.links.id_AnAge = 'Siren_lacertina'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Siren_lacertina}}';
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
bibkey = 'Luhr2008'; type = 'Phdthesis'; bib = [ ... 
'author = {T. M. Luhring}, ' ... 
'year = {2008}, ' ...
'title = {Population ecology of greater siren, \emph{Siren lacertina}}, ' ...
'school = {University of Georgia}, ' ...
'howpublished = {\url{https://getd.libs.uga.edu/pdfs/luhring_thomas_m_200805_ms.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Siren_lacertina}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Siren_lacertina/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

