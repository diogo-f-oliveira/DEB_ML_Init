  function [data, auxData, metaData, txtData, weights] = mydata_Auchenoglanis_occidentalis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Claroteidae';
metaData.species    = 'Auchenoglanis_occidentalis'; 
metaData.species_en = 'Bubu'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 28];

%% set data
% zero-variate data
data.ab = 11.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 39;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 70;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 8.3e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ShinIpin2012';
  comment.Wwb = 'based on egg diameter of 2.5 mm to 1.50 mm: pi/6*0.25^3';
data.Wwp = 653;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01023*Lp^3.02, see F1';
data.Wwi = 3.8e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.02, see F1';

data.Ri = 11442 /365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'ShinIpin2012';
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1  7.50
    2 17.99
    3 28.16
    4 40.56];
data.tL(:,1) = (data.tL(:,1)+0)*365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'IkonAtag2024';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^3.02'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '689S4'; % Cat of Life
metaData.links.id_ITIS = '680894'; % ITIS
metaData.links.id_EoL = '994704'; % Ency of Life
metaData.links.id_Wiki = 'Auchenoglanis_occidentalis'; % Wikipedia
metaData.links.id_ADW = 'Auchenoglanis_occidentalis'; % ADW
metaData.links.id_Taxo = '44013'; % Taxonomicon
metaData.links.id_WoRMS = '1015920'; % WoRMS
metaData.links.id_fishbase = 'Auchenoglanis-occidentalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Auchenoglanis_occidentalis}}';  
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
bibkey = 'IkonAtag2024'; type = 'article'; bib = [ ...
'howpublished = {\url{http://www.nijfaq.com.ngISSN-2350-1537}}, ' ...
'author = {Ikongbeh, O. A. and Ataguba, G. A.  and Omuwa, J. W.}, ' ...
'year = {2024}, ' ...
'title = {Age, Growth and Mortality of \emph{Auchenoglanis occidentalis} ({V}alenciennes, 1840) from {L}ake {A}kata, {B}enue {S}tate, {N}igeria}, ' ... 
'journal = {Nigerian Journal of Fisheries and Aquaculture}, ' ...
'volume = {12(1)}, '...
'pages = {26–36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShinIpin2012'; type = 'article'; bib = [ ...
'author = {B. A.  Shinkafi and J. K. Ipinjolu}, ' ...
'year = {2012}, ' ...
'title = {Gonadosomatic Index, Fecundity and Egg Size of \emph{Auchenoglanis occidentalis} ({C}uvier and {V}alenciennes) in {R}iver {R}ima, North-Western {N}igeria}, ' ... 
'journal = {Nigerian Journal of Basic and Applied Science}, ' ...
'volume = {20(3)}, '...
'pages = {217-224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Auchenoglanis-occidentalis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

