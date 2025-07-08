function [data, auxData, metaData, txtData, weights] = mydata_Psittacosaurus_mongoliensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Ornithischia'; 
metaData.family     = 'Psittacosauridae';
metaData.species    = 'Psittacosaurus_mongoliensis'; 
metaData.species_en = 'Psittacosaurus'; 

metaData.ecoCode.climate = {'BS', 'Df'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 1.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 10 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 12]; 

%% set data
% zero-variate data

data.tp = 10*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 30*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Wiki';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 12;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Wiki';
 comment.Lb = '11-13 cm';
data.Li  = 200;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Wiki';

data.Wwi = 25e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Estimate based on etrapolation of growth curve';
  
data.Ri  = 10/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Very speculative';
  
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (yr), wet weight (kg)
3	 0.94
4	 2.03
5	 3.02
6	 6.96
7	 8.79
8	17.16
9	19.87];  
units.tW   = {'yr', 'kg'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'EricTuma2000';
comment.tW = 'Temperature is speculative; weights reconstructured from bone lengths';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

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
D1 = 'Several data are very speculative, such as T, Wwb, Ri';
D2 = 'Neonate growth is possibly retarted by lower body temperature';
D3 = 'pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Extinct, lived 123.2 till 100 Ma ago';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4532055'; % Ency of Life
metaData.links.id_Wiki = 'Psittacosaurus_mongoliensis'; % Wikipedia
metaData.links.id_Taxo = '4466801'; % Taxonomicon

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Psittacosaurus}}';
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
bibkey = 'EricTuma2000'; type = 'Article'; bib = [ ... 
'author = {G. M. Erickson and T. A. Tumanova}, ' ... 
'year = {2000}, ' ...
'title = {Growth curve of \emph{Psittacosaurus mongoliensis} {O}sborn ({C}eratopsia: {P}sittacosauridae) inferred firom long bone histology}, ' ...
'journal = {Zool. J. Linn. Soc.}, ' ...
'volume = {130}, ' ...
'pages = {551--566}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

