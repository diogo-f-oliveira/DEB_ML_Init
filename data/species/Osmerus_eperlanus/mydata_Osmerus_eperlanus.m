  function [data, auxData, metaData, txtData, weights] = mydata_Osmerus_eperlanus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osmeriformes'; 
metaData.family     = 'Osmeridae';
metaData.species    = 'Osmerus_eperlanus'; 
metaData.species_en = 'European smelt'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jFr', 'jiMcp'};
metaData.ecoCode.embryo  = {'Fs', 'Fg', 'Fh'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 27]; 

%% set data
% zero-variate data
data.ab = 27; units.ab = 'd';       label.ab = 'age at birth';           bibkey.ab = 'QuigIgoe2004'; 
  temp.ab = C2K(7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12.8;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 45;   units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
 
data.Wwb = 2.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.6 to 0.9 mm: pi/6*0.075^3';

data.Ri = 13877/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'KorlMukh2009';  
  temp.Ri = C2K(6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 6.7
    2 10.8
    3 13.1
    4 15.2
    5 17.1];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(6); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'KorlMukh2009'};
comment.tL = 'data from Vygozero Reservoir';

% time-weight
data.tW = [ ... % time since birth (yr),wet weight (g)
    1 1.7
    2 9.0
    3 17.0
    4 27.0
    5 39.0];
data.tW(:,1) = data.tW(:,1) * 365; % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(6); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = {'KorlMukh2009'};
comment.tW = 'data from Vygozero Reservoir';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                                 
%% Links
metaData.links.id_CoL = '6SZTL'; % Cat of Life
metaData.links.id_ITIS = '162039'; % ITIS
metaData.links.id_EoL = '46563008'; % Ency of Life
metaData.links.id_Wiki = 'Osmerus_eperlanus'; % Wikipedia
metaData.links.id_ADW = 'Osmerus_eperlanus'; % ADW
metaData.links.id_Taxo = '42865'; % Taxonomicon
metaData.links.id_WoRMS = '126736'; % WoRMS
metaData.links.id_fishbase = 'Osmerus-eperlanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Osmerus_eperlanus}}';  
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
bibkey = 'KorlMukh2009'; type = 'Article'; bib = [ ...  
'doi = {10.1134/S0032945209080116}, ' ...
'author = {K. A. Korlyakov and I. S. Mukhachev}, ' ...
'year = {2009}, ' ...
'title = {On the {E}uropean Smelt \emph{Osmerus eperlanus} Introduced to {B}olshoi {K}isegach {L}ake in the {S}outh {U}rals}, ' ... 
'journal = {Journal of Ichthyology}, ' ...
'volume = {49}, '...
'pages = {668-673}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'QuigIgoe2004'; type = 'Article'; bib = [ ...  
'author = {Quigley, D. T. G. and Igoe, F. and OConnor, W.}, ' ...
'year = {2004}, ' ...
'title = {The {E}uropean smelt \emph{Osmerus eperlanus} {L}. in {I}reland: General biology, ecology, distribution and status with conservation recommendations}, ' ... 
'publisher = {Royal Irish Academy}, ' ...
'journal = {Threatened Irish Freshwater Fishes}, ' ...
'volume = {104B(3)}, '...
'pages = {57--66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Osmerus-eperlanus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
