function [data, auxData, metaData, txtData, weights] = mydata_Cepaea_nemoralis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Helicidae';
metaData.species    = 'Cepaea_nemoralis'; 
metaData.species_en = 'Grove snail'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Thl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

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

data.ab  = 20;   units.ab  = 'd'; label.ab  = 'age at birth';     bibkey.ab  = 'Wiki';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '15-20 d for the spring, longer in autumn';
data.tp  = 365;   units.tp  = 'd'; label.tp  = 'time since birth at puberty';     bibkey.tp  = 'Wiki';   
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am  = 8*365;   units.am  = 'd'; label.am  = 'life span';     bibkey.am  = 'Wiki';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.3; units.Lb  = 'cm';  label.Lb  = 'shell breath at birth';   bibkey.Lb  = 'Wiki';
data.Li  = 2.5; units.Li  = 'cm';  label.Li  = 'ultimate shell breath';   bibkey.Li  = 'Jans2015';

data.Wdi  = 0.2; units.Wdi  = 'g';  label.Wdi  = 'wet weight at 2.2 cm';   bibkey.Wdi  = 'Will1976';

data.Ri  = 80/365;   units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '9-26 eggs per clutch, 1 to 4 clutch per life time';
 
% uni-variate data
% time - length
data.tL = [ ... % time since 1 April 1972 (d), shell diameter (cm)
-0.231	0.758
43.039	0.844
89.749	1.057
149.745	1.234
212.591	1.275
365-0.440	1.284
365+35.162	1.334
365+88.162	1.538
365+169.116	1.705
365+210.326	1.705
730-5.124	1.674
730+33.536	1.725];
data.tL(:,1) = data.tL(:,1) + 730;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(21.5);  
units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Will1976';
comment.tL = 'data from Spring 1970 cohort';

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

%% discussion
D1 = 'Temperature trajectory in C for tL data is assumed to be  6 + 18 * cos(2*pi*(t-80)/365), with t in d since April 1';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'SBY4'; % Cat of Life
metaData.links.id_ITIS = '77910'; % ITIS
metaData.links.id_EoL = '449909'; % Ency of Life
metaData.links.id_Wiki = 'Cepaea_nemoralis'; % Wikipedia
metaData.links.id_ADW = 'Cepaea_nemoralis'; % ADW
metaData.links.id_Taxo = '38948'; % Taxonomicon
metaData.links.id_WoRMS = '235792'; % WoRMS
metaData.links.id_molluscabase = '235792'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cepaea_nemoralis}}';
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

