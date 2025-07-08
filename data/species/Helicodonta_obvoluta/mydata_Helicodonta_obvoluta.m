function [data, auxData, metaData, txtData, weights] = mydata_Helicodonta_obvoluta
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Helicodontidae';
metaData.species    = 'Helicodonta_obvoluta'; 
metaData.species_en = 'Cheese snail'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Thl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wdi'; 'Ri'}; 
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

data.ab  = 15;   units.ab  = 'd'; label.ab  = 'age at birth';     bibkey.ab  = 'Malt2003';   
  temp.ab = C2K(21.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '14-18 d for the spring, longer in autumn';
data.tp  = 160;   units.tp  = 'd'; label.tp  = 'time since birth at puberty';     bibkey.tp  = 'Malt2003';   
  temp.tp = C2K(21.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am  = 3*365;   units.am  = 'd'; label.am  = 'life span';     bibkey.am  = 'Malt2003';   
  temp.am = C2K(21.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.2; units.Lb  = 'cm';  label.Lb  = 'shell breath at birth';   bibkey.Lb  = 'Malt2003';
  comment.Lb = 'based on egg diameter of 2.1-2.85 mm';
data.Li  = 1.4; units.Li  = 'cm';  label.Li  = 'ultimate shell breath';   bibkey.Li  = 'Jans2015';

data.Wdi  = 5.15e-2; units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'Will1976';
  comment.Wdi = 'based on size-corrected value for Cepaea nemoralis: (1.4/2.2)^3*0.2';

data.Ri  = 26/365;   units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';     bibkey.Ri  = 'Malt2003';   
  temp.Ri = C2K(21.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '9-26 eggs per clutch, 1 to 4 clutch per life time';
 
% uni-variate data
% time - length
data.tL = [ ... % age (d), number of whorls (#)
17.020	0.965
47.171	2.097
79.479	2.856
107.956	3.546
138.605	4.057
169.241	4.390
199.882	4.804
229.421	5.095
260.049	5.331
290.125	5.497
324.027	5.664
351.918	5.858
381.992	5.998
411.514	6.082
441.575	6.055
472.733	6.084
504.437	6.100
533.953	6.101
565.655	6.089];
data.tL(:,2) = data.Lb*(data.Li/ data.Lb).^((data.tL(:,2)-data.tL(1,2))/(data.tL(end,2)-data.tL(1,2)));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(21.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Malt2003';
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
metaData.bibkey.F1 = 'Malt2003'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3K878'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4903480'; % Ency of Life
metaData.links.id_Wiki = 'Helicodonta_obvoluta'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '38970'; % Taxonomicon
metaData.links.id_WoRMS = '887089'; % WoRMS
metaData.links.id_molluscabase = '887089'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Helicodonta_obvoluta}}';
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
bibkey = 'Malt2003'; type = 'Article'; bib = [ ... 
'author = {Tomasz Krzysztof Maltz}, ' ... 
'title = {LIFE CYCLE AND POPULATION DYNAMICS OF \emph{Helicodonta obvoluta} ({O}. {F}. {M}\"{u}ller, 1774) ({G}ASTROPODA: {P}ULMONATA: {H}ELICIDAE)}, ' ...
'journal = {Folia Malacologica}, ' ...
'volume = {11}, ' ...
'year = {2003}, ' ...
'pages = {63-88}'];
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
%
bibkey = 'Jans2015'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Bert Jansen}, ' ...
'year = {2015}, ' ...
'title  = {Veldgids Slakken en Mossels}, ' ...
'publisher = {KNNV}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

