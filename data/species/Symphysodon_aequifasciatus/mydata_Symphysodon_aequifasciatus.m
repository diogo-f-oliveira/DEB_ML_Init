function [data, auxData, metaData, txtData, weights] = mydata_Symphysodon_aequifasciatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Symphysodon_aequifasciatus'; 
metaData.species_en = 'Blue discus'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 11];

%% set data
% zero-variate data

data.am = 6*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 13.7;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'RossAmad2010';
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*0.1^3';
data.Wwp = 6.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.02692*Lp^3.048, see F1';
data.Wwi = 78.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02692*Li^3.048, see F1';

data.Ri  = 1892/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'RossAmad2010';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length-weight
data.tLW = [ ... % time (wk), std length (cm), weight (g)
    0	3.597  3.276
    2	4.129  3.988
    4	4.684  5.982
    6	5.383  7.929
    8	5.653 10.588
   10	6.018 12.107
   12	6.478 13.009];
data.tLW(:,1) = data.tLW(:,1)*7 ; % convert wk to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time', 'total length', 'weight'};  
temp.tLW    = C2K(28);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'TibiSawa2016'; treat.tLW = {1 {'length','weight'}};
    
%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.02692*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '53QBZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '356839'; % Ency of Life
metaData.links.id_Wiki = 'Symphysodon_aequifasciatus'; % Wikipedia
metaData.links.id_ADW = 'Symphysodon_aequifasciatus'; % ADW
metaData.links.id_Taxo = '188512'; % Taxonomicon
metaData.links.id_WoRMS = '1018653'; % WoRMS
metaData.links.id_fishbase = 'Symphysodon-aequifasciatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Symphysodon_aequifasciatus}}';
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
bibkey = 'TibiSawa2016'; type = 'article'; bib = [ ... 
'doi = {10.4194/1303-2712-v16_2_2}, ' ...
'author = {Raju Mahadev Tibile and Paramita Banerjee Sawant and Narinder Kumar Chadha and Wazir Singh Lakra and Chandra Prakash and Sambid Swain and Kaustubh Bhagawati}, ' ... 
'year = {2016}, ' ...
'title = {Effect of Stocking Density on Growth, Size Variation, Condition Index and Survival of Discus, \emph{Symphysodon aequifasciatus} {P}ellegrin, 1904}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {16}, ' ...
'pages = {453-460}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MattScre2016'; type = 'article'; bib = [ ... 
'doi = {10.1590/1809-4392201600234}, ' ...
'author = {Douglas da Cruz Mattos and  Rafaela Screnci-Ribeiro and Leonardo Demier Cardoso and Manuel Vazquez Vidal Junior}, ' ... 
'year = {2016}, ' ...
'title = {Description of the reproductive behavior of \emph{Symphysodon aequifasciatus} ({C}ichlidae) in captivity}, ' ...
'journal = {Acta Amazonica}, ' ...
'volume = {46(4)}, ' ...
'pages = {433-438}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RossAmad2010'; type = 'article'; bib = [ ... 
'author = {Felipe Rossoni and Sidin\''{e}ia Amadio and Efrem Ferreira and Jansen Zuanon}, ' ... 
'year = {2010}, ' ...
'title = {Reproductive and population parameters of discus fish \emph{Symphysodon aequifasciatus} {P}ellegrin, 1904 ({P}erciformes: {C}ichlidae) from {P}iaga\c{c}u-{P}urus Sustainable Development Reserve (RDS-PP), lower {P}urus {R}iver, {A}mazonas, {B}razil}, ' ...
'journal = {Neotropical Ichthyology}, ' ...
'volume = {8(2)}, ' ...
'pages = {379-383}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Symphysodon-aequifasciatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

