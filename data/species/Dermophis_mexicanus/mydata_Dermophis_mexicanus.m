function [data, auxData, metaData, txtData, weights] = mydata_Dermophis_mexicanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Gymnophiona'; 
metaData.family     = 'Dermophiidae';
metaData.species    = 'Dermophis_mexicanus'; 
metaData.species_en = 'Mexican burrowing caecilian'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTva', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 22];


%% set data
% zero-variate data

data.am = 13.8*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.7;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'Wake1980';  
  comment.Lb = '15 to 20 mm hatch from egg membrane';
data.Lj  = 13.5;     units.Lj  = 'cm';  label.Lj  = 'total length at metam';    bibkey.Lj  = 'Wake1980';  
  comment.Lj = 'coincides with leaving the mother';
data.Lp  = 32;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Wake1980';
data.Li  = 48.7;    units.Li = 'cm'; label.Li = 'ultimate total length'; bibkey.Li  = 'Wake1980';

data.Wwb = 0.0064;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Wake1980';
  comment.Wwb = 'based on Wwi*(L_b/L_m)^3';
data.Wwj = 3.2;     units.Wwj = 'g';   label.Wwj = 'wet weight at metam';      bibkey.Wwj = 'Wake1980';
  comment.Wwj = 'based on Wwi*(L_j/L_m)^3';
data.Wwp = 42.5;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Wake1980';
  comment.Wwp = 'based on Wwi*(L_p/L_m)^3';
data.Wwi = 150;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wake1980';

data.Ri  = 36/365/2;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wake1980';   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '36 eggs per clutch, 1 clutch each other yr';

% uni-variate data

% time - length
data.tL = [ ... % time (d), length (cm)
13.414	14.377
61.617	17.877
216.179	22.465
309.420	25.452
386.495	26.834
585.568	28.572
734.806	29.584
886.319	30.669
1033.268	31.535
1191.504	32.400
1345.094	32.682]; 
data.tL(:,1) = data.tL(:,1) - data.tL(1,1); % set origin at metam
units.tL   = {'d', 'cm'};  label.tL = {'time since metam', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wake1980';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Young feed on maternal glandular secretions, scraping the inside of the oviduct; some 5 young per clutch are actually produced';
metaData.bibkey.F1 = {'Wiki','Wake1980'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '34XMH'; % Cat of Life
metaData.links.id_ITIS = '586253'; % ITIS
metaData.links.id_EoL = '1048421'; % Ency of Life
metaData.links.id_Wiki = 'Dermophis_mexicanus'; % Wikipedia
metaData.links.id_ADW = 'Dermophis_mexicanus'; % ADW
metaData.links.id_Taxo = '137530'; % Taxonomicon
metaData.links.id_WoRMS = '1506618'; % WoRMS
metaData.links.id_amphweb = 'Dermophis+mexicanus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Dermophis_mexicanus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dermophis_mexicanus}}';
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
bibkey = 'Wake1980'; type = 'Article'; bib = [ ...
'author = {Marvalee H. Wake}, ' ... 
'year = {1980}, ' ...
'title = {Reproduction, Growth, and Population Structure of the {C}entral {A}merican Caecilian \emph{Dermophis mexicanus}}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {36}, ' ...
'pages = {244-256}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Dermophis_mexicanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

