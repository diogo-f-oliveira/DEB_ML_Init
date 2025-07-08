function [data, auxData, metaData, txtData, weights] = mydata_Cyzicus_grubei
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Spinicaudata'; 
metaData.family     = 'Cyzicidae';
metaData.species    = 'Cyzicus_grubei'; 
metaData.species_en = 'Iberian clam shrimp'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'Hha'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 07]; 

%% set data
% zero-variate data

data.tp = 82;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'PerePiri2014';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '75-90 d';
data.am = 180;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'PerePiri2014';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '130-150 d';

data.Lp  = 0.821;  units.Lp = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'PerePiri2014';
data.Lpm  = 0.813;  units.Lpm = 'cm';  label.Lpm  = 'carapace length at puberty for males'; bibkey.Lpm  = 'PerePiri2014';
data.Li  = 1.0;  units.Li = 'cm';  label.Li  = 'ultimate carapace length';   bibkey.Li  = 'PerePiri2014';
data.Lim  = 1.158;  units.Lim = 'cm';  label.Lim  = 'ultimate carapace length for males';   bibkey.Lim  = 'PerePiri2014';

data.Wwb  = 3.6e-6; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 200-210 mum of Eulimnadia antlei, but that probably includes the ridges: pi/6*190e-4^3';
data.Wwi  = 0.196;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on foto length 1 cm, height 0.625 cm, thickness 0.2 cm: pi/4*1*0.625*0.4; uncertain because of water in carapace';

data.Ri  = 1068/4;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'PerePiri2014';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1068 eggs per female, clutch interval guessed at 5 d, based on Artemia salina';
 
% uni-variate data

% time-length
data.tL_fm = [ ... % time since 1 Jan (d), carapace length (cm), for female, male
    41 0.659 0.646
    58 0.654 0.656
    73 0.728 0.696
    87 0.689 0.706
   101 0.836 0.825
   115 0.876 0.938
   129 0.940 0.943
   143 0.945 0.950
   157 0.936 0.964
   171 0.970 0.985
   186 0.980 1.004];
data.tL_fm(:,1) = data.tL_fm(:,1) - 10; % set origin at birth using (tp, Lp)
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'carapace length'};  
temp.tL_fm = [0 10.5; 5 15; 60 15; 70 23]; units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'female','male'}};
bibkey.tL_fm = 'PerePiri2014';
comment.tL_fm = 'water temperature: 10.3 C in Jan to 22.8 C in July; data from length frequency counts';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 2 * weights.Li;
weights.Lim = 2 * weights.Lim;
weights.tL_fm = 5 * weights.tL_fm;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Endemic to Iberian Peninsula and one temporary pond on Minorca Island (Balearic Islands)';
metaData.bibkey.F1 = 'PerePiri2014'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'BJMWM'; % Cat of Life
metaData.links.id_ITIS = '1205128'; % ITIS
metaData.links.id_EoL = '3208893'; % Ency of Life
metaData.links.id_Wiki = 'Cyzicus'; % Wikipedia
metaData.links.id_ADW = 'Cyzicus'; % ADW
metaData.links.id_Taxo = '33134'; % Taxonomicon
metaData.links.id_WoRMS = '593225'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyzicus}}';
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
bibkey = 'PerePiri2014'; type = 'Article'; bib = [ ... 
'doi = {10.23818/limn.33.18}, ' ...
'author = {José Luis P\''{e}rez-Bote and Juan Pablo Gonz\''{a}lez P\''{i}riz and Alejandro Galeano Sol\''{i}s}, ' ... 
'year = {2014}, ' ...
'title = {Biological traits of \emph{Cyzicus grubei} ({C}rustacea, {S}pinicaudata, {C}yzicidae) in south-western {I}berian {P}eninsula}, ' ...
'journal = {Limnetica}, ' ...
'volume = {33(2)}, ' ...
'pages = {227-236}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

