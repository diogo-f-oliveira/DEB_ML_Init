  function [data, auxData, metaData, txtData, weights] = mydata_Rhodeus_amarus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Rhodeus_amarus'; 
metaData.species_en = 'European bitterling'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 02 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 14]; 

%% set data
% zero-variate data
data.ab = 18;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'SmitReic2013'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'all temps are guessed';
data.ap = 365;     units.ap = 'd';  label.ap = 'age at puberty';         bibkey.ap = 'Wiki';
  temp.ap = C2K(18); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.4;     units.Lb = 'cm'; label.Lb = 'standard length at birth';  bibkey.Lb = 'BattStoi2005';
data.Lp = 3.25;    units.Lp = 'cm'; label.Lp = 'standard length at puberty';bibkey.Lp = 'Wiki'; 
data.Li = 8.61;    units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'BattStoi2005';
  comment.Li = 'fishbase: 11.2 cm';

data.Wwb = 0.002;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BattStoi2005';
data.Wwp = 1.00;    units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'BattStoi2005';
  comment.Wwp = 'Weight at L = 3.25 cm';
data.Wwi = 8.63;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'BattStoi2005';
  
data.Ri = 136/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at 4 cm';   bibkey.Ri = 'Kone2012';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (g)
0 0.002
1 0.82
2 3.17
3 6.07
4 7.56
5 8.20];
data.tW(:,1) = 365 * data.tW(:,1);
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(18);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BattStoi2005';
comment.tW = 'Tmep is guessed';

% length-weight
data.LW = [ ... % length (cm), wet weight (g)
3.68 1.01
4.06 1.58
4.45 2.33
5.21 2.18
5.59 3.00
6.35 3.50
6.73 4.00
7.11 6.00];
units.LW = {'cm', 'g'};  label.LW = {'standard length', 'wet weight'};  
bibkey.LW = 'BattStoi2005';

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
                                 
%% Links
metaData.links.id_CoL = '6X6ZT'; % Cat of Life
metaData.links.id_ITIS = '163610'; % ITIS
metaData.links.id_EoL = '217578'; % Ency of Life
metaData.links.id_Wiki = 'Rhodeus_amarus'; % Wikipedia
metaData.links.id_ADW = 'Rhodeus_amarus'; % ADW
metaData.links.id_Taxo = '92917'; % Taxonomicon
metaData.links.id_WoRMS = '154331'; % WoRMS
metaData.links.id_fishbase = 'Rhodeus-amarus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rhodeus_amarus}}';  
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
bibkey = 'BattStoi2005'; type = 'Article'; bib = [ ...  
'author = {K. W. Battes and I. Stoica}, ' ...
'year = {2005}, ' ...
'title = {BITTERLING GROWTH BIOLOGY (\emph{Rhodeus amarus} {L}.) IN THE {B}ISTRIA {R}IVER}, ' ... 
'journal = {Analele Univ. Oradea, Fasc. Biologie}, ' ...
'volume = {12}, '...
'pages = {21--29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kone2012'; type = 'Article'; bib = [ ...  
'author = {M. Konecna}, ' ...
'year = {2012}, ' ...
'title = {Reproduction mode of {E}uropean Bitterling (\emph{Rhodeus amarus}, {B}loch, 1782) determined through rapid oocyte counts and size determination using digital imaging}, ' ... 
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {28}, '...
'pages = {806-810}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SmitReic2013'; type = 'Article'; bib = [ ...  
'author = {C. Smith and M. Reichard}, ' ...
'year = {2013}, ' ...
'title = {A sperm competition model for the {E}uropean bitterling (\emph{Rhodeus amarus})}, ' ... 
'journal = {Behaviour}, ' ...
'volume = {150}, '...
'pages = {1709-1730}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/4483}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

