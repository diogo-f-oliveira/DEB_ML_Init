function [data, auxData, metaData, txtData, weights] = mydata_Boa_constrictor

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Boidae';
metaData.species    = 'Boa_constrictor'; 
metaData.species_en = 'Columbian boa'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-R'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 12 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 17];


%% set data
% zero-variate data

data.ab = 100;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Wiki: 100-120 d; all temps are guessed';
data.ap = 4*365;  units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'Wiki';
  temp.ap = C2K(29);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'Wiki: 3-4 yr';
data.am = 40*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 45;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';  
  comment.Lb = 'Wiki: 38 till 51 g';
data.Lp  = 170;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki';
  comment.Lp = 'Wiki: 6 till 10 ft, but LN data shows eggs at 175 cm';
data.Li  = 450;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Abuy2003';

data.Wwb = 190;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Abuy2003';
data.Wwi = 45000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 65/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Abuy2003';   
temp.Ri = C2K(29);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% Data from Abuy2003
tLW = [ 2  210  759 2625  4125;    % d, time since birth
        47   90  145  210   250;    % cm, physical length
        68  325 2400 5400 18000]';  % g, wet weight  (including eggs)
%
data.tL = tLW(:,[1 2]); 
units.tL  = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(29); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Abuy2003';
%
data.LW = tLW(:,2:3); data.LW = [data.LW; 175 5000; 300 24000; 450 45000];
units.LW  = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Abuy2003';
%
data.LN = [175 250 300; 18 43 58]';     % cm, # length, number of eggs
units.LN   = {'cm', '#'};  label.LN = {'total length', 'number of eggs'};  
temp.LN    = C2K(29);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Abuy2003';
 
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

%% Facts
F1 = 'sometimes parthenogenetic reproduction';
metaData.bibkey.F1 = 'Abuy2003'; 
F2 = 'a snake of 300 cm, 24 kg dropped to 13 kg after laying 50 young + 58 eggs';
metaData.bibkey.F2 = 'Abuy2003'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'M7TX'; % Cat of Life
metaData.links.id_ITIS = '209569'; % ITIS
metaData.links.id_EoL = '795595'; % Ency of Life
metaData.links.id_Wiki = 'Boa_constrictor'; % Wikipedia
metaData.links.id_ADW = 'Boa_constrictor'; % ADW
metaData.links.id_Taxo = '49860'; % Taxonomicon
metaData.links.id_WoRMS = '1389961'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Boa&species=constrictor'; % ReptileDB
metaData.links.id_AnAge = 'Boa_constrictor'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Boa_constrictor}}';
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
bibkey = 'Abuy2003'; type = 'Book'; bib = [ ... 
'author = {Abuys, A.}, ' ... 
'year = {2003}, ' ...
'title = {De slangen van Suriname.}, ' ...
'publisher = {Gopher Publ.}, ' ...
'address = {Groningen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

