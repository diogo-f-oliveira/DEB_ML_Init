function [data, auxData, metaData, txtData, weights] = mydata_Bulinus_globosus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Bulinidae';
metaData.species    = 'Bulinus_globosus'; 
metaData.species_en = 'Freshwater snail'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ni_T'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 19]; 

%% set data
% zero-variate data

data.am = 450; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Shif1964';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.11; units.Lb  = 'cm';  label.Lb  = 'shell height at birth';   bibkey.Lb  = 'Shif1964a';
data.Lp  = 0.5; units.Lp  = 'cm';  label.Lp  = 'shell height at puberty'; bibkey.Lp  = 'Shif1964a';
data.Li  = 1.76; units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'Shif1964a';
  comment.Li = 'based on extrapolation of tL data';

data.Wwi  = 3.9; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'value for Planorbarius corneus: 1.6*(1.76/1.3)^3';

data.N27  = 143.7;   units.N27  = '#'; label.N27  = 'number of eggs at 434 d since birth';     bibkey.N27  = 'Shif1964';   
  temp.N27 = C2K(27);  units.temp.N27 = 'K'; label.temp.N27 = 'temperature';
data.N25  = 467.3;   units.N25  = '#'; label.N25  = 'number of eggs at 434 d since birth';     bibkey.N25  = 'Shif1964';   
  temp.N25 = C2K(25);  units.temp.N25 = 'K'; label.temp.N25 = 'temperature';
data.N22  = 382.9;  units.N22  = '#'; label.N22  = 'number of eggs at 434 d since birth';     bibkey.N22  = 'Shif1964';   
  temp.N22 = C2K(22.5);  units.temp.N22 = 'K'; label.temp.N22 = 'temperature';
data.N18  = 27.7;  units.N18  = '#'; label.N18  = 'number of eggs at 364 d since birth';     bibkey.N18  = 'Shif1964';   
  temp.N18 = C2K(18);  units.temp.N18 = 'K'; label.temp.N18 = 'temperature';
 
% uni-variate data
% time - length
data.tL27 = [ ... % age (d), shell height (cm)
    28 0.176
    55 0.562
    77 0.750
   115 1.003
   145 1.108
   201 1.198];
units.tL27   = {'d', 'cm'};  label.tL27 = {'time since birth', 'shell height', '27 C'};  
temp.tL27    = C2K(27);  units.temp.tL27 = 'K'; label.temp.tL27 = 'temperature';
bibkey.tL27 = 'Shif1964a';
%
data.tL25 = [ ... % age (d), shell height (cm)
    35 0.208
    54 0.562
    62 0.708
   106 1.124
   123 1.176
   163 1.235
   200 1.280];
units.tL25   = {'d', 'cm'};  label.tL25 = {'time since birth', 'shell height', '25 C'};  
temp.tL25    = C2K(25);  units.temp.tL25 = 'K'; label.temp.tL25 = 'temperature';
bibkey.tL25 = 'Shif1964a';
%
data.tL22 = [ ... % age (d), shell height (cm)
    41 0.245
    60 0.321
    95 0.626
   135 0.969
   201 1.135];
units.tL22   = {'d', 'cm'};  label.tL22 = {'time since birth', 'shell height', '22.5 C'};  
temp.tL22    = C2K(22.5);  units.temp.tL22 = 'K'; label.temp.tL22 = 'temperature';
bibkey.tL22 = 'Shif1964a';

%% set weights for all real data
weights = setweights(data, []);
weights.tL27 = 5 * weights.tL27;
weights.tL25 = 5 * weights.tL25;
weights.tL22 = 3 * weights.tL22;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL27','tL25','tL22'}; subtitle1 = {'Data for 27, 25, 22.5 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'NTP2'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4939640'; % Ency of Life
metaData.links.id_Wiki = 'Bulinus_globosus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1686758'; % Taxonomicon
metaData.links.id_WoRMS = '1058683'; % WoRMS
metaData.links.id_molluscabase = '1058683'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bulinus_globosus}}';
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
bibkey = 'Shif1964'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00034983.1964.11686219}, ' ...
'author = {C. J. Shiff}, ' ... 
'title = {Studies on \emph{Bulinus (Physopsis) globosus} in {R}hodesia I}, ' ...
'journal = {Annals of Tropical Medicine \& Parasitology}, ' ...
'volume = {58(1)}, ' ...
'year = {1964}, ' ...
'pages = {94-105}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shif1964a'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00034983.1964.11686220}, ' ...
'author = {C. J. Shiff}, ' ... 
'title = {Studies on \emph{Bulinus (Physopsis) globosus} in {R}hodesia II}, ' ...
'journal = {Annals of Tropical Medicine \& Parasitology}, ' ...
'volume = {58(1)}, ' ...
'year = {1964}, ' ...
'pages = {106-115}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
