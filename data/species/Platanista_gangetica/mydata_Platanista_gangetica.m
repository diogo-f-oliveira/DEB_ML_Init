function [data, auxData, metaData, txtData, weights] = mydata_Platanista_gangetica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Platanistidae';
metaData.species    = 'Platanista_gangetica'; 
metaData.species_en = 'Ganges river dolphin'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'; 't-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm   = [2023 08 19];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 19];

%% set data
% zero-variate data

data.tg = 305;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'Wiki';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '8-12 mnth';
data.tx = 9*30.5;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '2-12 mnth, typically 9 mnth';
data.tp = 3650;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';   
  temp.tp = C2K(35.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 30*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Wiki';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 70; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'ADW';
  comment.Lb = '70-90 cm';
data.Lp = 175; units.Lp = 'cm';   label.Lp = 'length at puberty for female'; bibkey.Lp = 'Kasu1972';
  comment.Lp = '150 - 200 cm';
data.Lpm = 130; units.Lpm = 'cm';   label.Lpm = 'length at puberty for male'; bibkey.Lpm = 'Kasu1972';
data.Li = 240; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'Wiki';
 comment.Li = '2.2-2.6 m';

data.Wwb = 3500; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Kasu1972';
data.Wwi = 80e3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Carw1995';
  comment.Wwi = 'Carw1995: 70-90 kg; AnAge: 70 kg';
  
data.Ri  = 1/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'calving interval 15-36 mnth';
  
% univariate data
% length-weight
data.LW = [ ... % length (cm), weight (kg)
    115.0 18.8
    113.0 14.5
    115.0 16.8
    118.0 16.4
    120.5 17.0
    127.0 23.0
    126.0 17.0
    122.0 22.5
    199.0 84.0
     76.0  3.4
    126.0 24.0];
units.LW = {'cm', 'kg'}; label.LW = {'length', 'weight'};  
bibkey.LW = 'Kasu1972'; 

% time-length
data.tL = [ ... % time since birth (d), length (vm)
0.000	69.446
157.296	100.710
173.694	101.907
227.138	115.211
278.760	115.477
285.441	110.155
348.602	117.339
357.105	116.142
362.571	116.009
368.037	120.931
369.251	117.073
381.398	114.013
382.005	115.078
382.612	112.949
383.827	122.262
384.434	119.069
385.042	120.665
389.900	114.812
458.527	118.271
461.564	120.931
479.176	126.120
495.574	121.863
541.730	123.060
542.338	127.583
568.453	126.253];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'length'};  
temp.tL = C2K(35.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kasu1972'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL =  3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6VNVB'; % Cat of Life
metaData.links.id_ITIS = '180413'; % ITIS
metaData.links.id_EoL = '46559405'; % Ency of Life
metaData.links.id_Wiki = 'Platanista_gangetica'; % Wikipedia
metaData.links.id_ADW = 'Platanista_gangetica'; % ADW
metaData.links.id_Taxo = '68673'; % Taxonomicon
metaData.links.id_WoRMS = '68673'; % WoRMS
metaData.links.id_MSW3 = '14300134'; % MSW3
metaData.links.id_AnAge = 'Platanista_gangetica'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platanista_gangetica}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Platanista_gangetica/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46559405/data}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Carw1995'; type = 'Book'; bib = [ ... 
'author = {Mark Carwardine}, ' ...
'year = {1995}, ' ...
'title  = {Whales, dolphins and porpoises}, ' ...
'publisher = {Dorling Kindersley}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kasu1972'; type = 'Article'; bib = [ ...
'author = {Toshio Kasuya}, ' ...
'year   = {1972}, ' ...
'title  = {SOME INFORMATIONS ON THE GROWTH OF THE {G}ANGES DOLPHIN WITH A COMMENT ON THE {I}NDUS DOLPHIN}, ' ...
'journal = {Sci. Rep. Whales Res. Inst.}, ' ...
'volume = {24}, ' ...
'page = {87-108}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

