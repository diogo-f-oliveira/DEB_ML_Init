  function [data, auxData, metaData, txtData, weights] = mydata_Stenodus_nelma
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Stenodus_nelma'; 
metaData.species_en = 'Nelma'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MPN','MN','TH'};
metaData.ecoCode.habitat = {'0jFr', '0iFe', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 22];

%% set data
% zero-variate data
data.am = 22*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Stenodus leucichthys';

data.Lp = 70;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
  comment.Lp = '28 to 34 cm';
data.Li = 150;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 8.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwp = 2.7e3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00457*Lp^3.13, see F1';
data.Wwi = 29.6e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on  0.00457*Li^3.13, see F1';
    
data.Ri = 4.2e5/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(11); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tW = [ ... % time (mnth), weight (g)
    0  18.6
    1  27.5
    2  38.9
    3  52.1
    4  68.5
    5  78.3
    6  94.6
    7 114.2
    8 146.5
    9 209.4
   10 230.6];
data.tW(:,1) = 30.5 * data.tW(:,1);
units.tW = {'d', 'g'}; label.tW = {'time', 'weight'};  
temp.tW = C2K(11);  units.temp.tW = 'K'; label.temptW = 'temperature';
bibkey.tW = 'KuchBuze2024';
comment.tW = 'temperature varied between 4 and 16 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tW =  5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J =  0;  weights.psd.k = 0.1;;

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
F1 = 'length-weight: Ww in g = 0.00457*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4ZYGZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46563189'; % Ency of Life
metaData.links.id_Wiki = 'Stenodus_nelma'; % Wikipedia
metaData.links.id_ADW = 'Stenodus_nelma'; % ADW
metaData.links.id_Taxo = '1683172'; % Taxonomicon
metaData.links.id_WoRMS = '712454'; % WoRMS
metaData.links.id_fishbase = 'Stenodus-nelma'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Stenodus_nelma}}';  
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
bibkey = 'KuchBuze2024'; type = 'Article'; bib = [ ... 
'doi = {10.61976/fsu2024.03.082}, ' ...
'author = {Anna Kucheruk and I. Buzevych and A. Mruk and N. Vovk}, ' ...
'year = {2024}, ' ...
'title = {RESULTS OF GROWING NELMA (\emph{Stenodus nelma} {P}ALLAS, 1773) IN RECIRCULATION AQUACULTURE SYSTEMS}, ' ... 
'journal = {Technologies in Aquaculture; Ribogospod. nauka Ukr.}, ' ...
'pages = {82-93}, ' ...
'volume = {3(69)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Stenodus-nelma.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

