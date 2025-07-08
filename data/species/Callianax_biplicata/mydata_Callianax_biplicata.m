function [data, auxData, metaData, txtData, weights] = mydata_Callianax_biplicata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Olividae';
metaData.species    = 'Callianax_biplicata'; 
metaData.species_en = 'Purple dwarf olive';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 01]; 

%% set data
% zero-variate data

data.am = 11*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'inverts';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '8-15 yr';

data.Lp  = 1.2;    units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 3.12;    units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'inverts';

data.Wwb = 7e-6; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 240 mum: 4/3 * pi * (0.012)^3';
data.Wwi = 4.16;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'ArriTeso2012';
  comment.Wwi = 'Based on 10^(-4.76+3.60*log10(10*Li)), see F1';

data.Ri  = 40*12/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Urosalpinx_cinerea';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (mnth), shell length (cm)
    6 mean([1.78 2.19])
   12 mean([1.76 1.97])
   18 mean([1.93 2.01])
   24 mean([1.92 2.10])
   30 mean([2.25])
   36 mean([2.02 2.26])];
data.tL(:,1) = 30.5 * (0.9+data.tL(:,1)); % convert mnth to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Stoh1968';
comment.tL = 'Temperature ranges from 8.4 to 20.8 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight for Olivancillaria_deshayesiana log10(SFWM in g) = -4.76+ 3.60 * log10(SL in mm)';
metaData.bibkey.F1 = 'ArriTeso2012'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7QJ5X'; % Cat of Life
metaData.links.id_ITIS = '74225'; % ITIS
metaData.links.id_EoL = '51497084'; % Ency of Life
metaData.links.id_Wiki = 'Callianax_biplicata'; % Wikipedia
metaData.links.id_ADW = 'Olivella_biplicata'; % ADW
metaData.links.id_Taxo = '5294746'; % Taxonomicon
metaData.links.id_WoRMS = '1424883'; % WoRMS
metaData.links.id_molluscabase = '1424883'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Callianax_biplicata}}';
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
bibkey = 'Stoh1968'; type = 'Article'; bib = [ ... 
'author = {Rudolf Stohler}, ' ... 
'year = {1968}, ' ...
'title = {Growth study in \emph{Olivella biplicata} ({S}owerby, 1825)}, ' ...
'journal = {The Veliger}, ' ...
'volume = {11(2)}, ' ...
'pages = {259-267}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'inverts'; type = 'Misc'; bib = ...
'howpublished = {\url{https://inverts.wallawalla.edu/Mollusca/Gastropoda/Prosobranchia/Order_Neogastropoda/Suborder_Rachiglossa/Family_Olividae/Olivella_biplicata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArriTeso2012'; type = 'Article'; bib = [ ... 
'doi = {10.4002/040.055.0111}, ' ...
'author = {Florencia Arrighetti and Valeria Teso and Thomas Brey Andreas Mackensen and Pablo E. Penchaszadeh}, ' ... 
'year = {2012}, ' ...
'title = {Age and Growth of \emph{Olivancillaria deshayesiana} ({G}astropoda: {O}lividae) in the {S}outhwestern {A}tlantic {O}cean}, ' ...
'journal = {Malacologia}, ' ...
'volume = {55(1)}, ' ...
'pages = {163-170}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

