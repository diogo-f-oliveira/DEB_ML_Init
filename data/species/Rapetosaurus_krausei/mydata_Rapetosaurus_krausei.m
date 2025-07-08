function [data, auxData, metaData, txtData, weights] = mydata_Tyrannosaurus_rex

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Saurischia'; 
metaData.family     = 'Nemegtosauridae';
metaData.species    = 'Rapetosaurus_krausei'; 
metaData.species_en = 'Rapetosaurus'; 

metaData.ecoCode.climate = {'A', 'Df'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 1.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 20]; 

%% set data
% zero-variate data

data.tp = 10*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guess based on Apatosaurus_spec';
data.am = 100*365;    units.am = 'd';    label.am = 'life span';                  bibkey.am = 'guess';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'guess based on Apatosaurus_spec';

data.Wwb = 3.4e3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'RogeWhit2016';
data.Wwi = 16.684e6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'RogeWhit2016';

data.Ri  = 20/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Very speculative';
 
% uni-variate data
% time-weight
data.tW = [ ...   % time since birth (yr), wet weight (kg)
 0           3.4
58/365      40    % 39 till 77 d since birth
7         1850    % age guessed by SK
40       16684];  % age guessed by SK
units.tW   = {'yr', 'kg'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RogeWhit2016';
comment.tW = 'Temperature is speculative; weights reconstructured from bone lengths; ages of data-point 3 and 4 are guessed';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Several data are very speculative, such as T, Ri';
D2 = 'Neonate growth is possibly retarted by lower body temperature';
D3 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Extinct, lived around 70 Ma ago';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4657962'; % Ency of Life
metaData.links.id_Wiki = 'Rapetosaurus'; % Wikipedia
metaData.links.id_Taxo = '4937360'; % Taxonomicon

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tyrannosaurus_rex}}';
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
bibkey = 'RogeWhit2016'; type = 'Article'; bib = [ ... 
'author = {K. C. Rogers and M. Whitney and M. D''Emic and B. Bagley}, ' ... 
'year = {2016}, ' ...
'title = {Precocity in a tiny titanosaur from the Cretaceous of {M}adagascar}, ' ...
'journal = {Science}, ' ...
'volume = {352}, ' ...
'pages = {450--453}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Learning'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.enchantedlearning.com/subjects/dinosaurs/anatomy/Repro.shtml}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%

