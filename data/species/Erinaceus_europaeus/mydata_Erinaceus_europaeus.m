function [data, auxData, metaData, txtData, weights] = mydata_Erinaceus_europaeus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Erinaceidae';
metaData.species    = 'Erinaceus_europaeus'; 
metaData.species_en = 'Hedgehog'; 

metaData.ecoCode.climate = {'BSk', 'Csa', 'Cfb', 'Csb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiHs', 'xiF'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 10 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 14];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2023 04 11];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 11];

%% set data
% zero-variate data

data.tg = 35;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Wiki: 31-39 d';
data.tx = 42;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'wildpro';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Wiki: 4-6 w';
data.tp = 253;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Anage';
  temp.tp = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'Wiki';   
  temp.am = C2K(35);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Wiki: 2-5 yr, max 10 yr';
  
data.Li  = 25;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'uksafari';

data.Wwb = 18;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'Wiki: 12-35 g';
data.Wwx = 235;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 1300; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Jack2006';

data.Ri  = 2*4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Jack2006';   
  temp.Ri = C2K(35); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
30.030	157.576
40.060	212.121
50.091	262.121
59.857	301.515
70.017	372.727
79.914	424.242
89.543	475.758
99.845	513.636];
units.tW_f  = {'d', 'g'}; label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f   = C2K(35); units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Jack2006';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
29.882	157.742
39.896	217.002
49.777	277.774
60.189	327.949
69.936	399.326
79.947	466.161
89.827	534.509
99.986	543.771];
units.tW_m  = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(35); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Jack2006';
%
data.tW_f1 = [ ... % time (julian d), wet weight (g)
123.714	290.000
128.000	285.000
130.000	300.000
132.000	335.000
141.143	418.333
171.143	451.667
177.143	486.667
195.143	475.000
206.857	533.333
222.000	575.000
241.714	625.000
248.000	635.000
266.857	660.000
270.000	670.000
276.000	663.333];
data.tW_f1(:,1) = data.tW_f1(:,1) - data.tW_f1(1,1);
units.tW_f1  = {'d', 'g'};  label.tW_f1 = {'time', 'wet weight'};  
temp.tW_f1   = C2K(35);  units.temp.tW_f1 = 'K'; label.temp.tW_f1 = 'temperature';
bibkey.tW_f1 = 'Jack2006';
comment.tW_f1 = 'female, second year sub-adult, directly after emergence from hibernation';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3B2C2'; % Cat of Life
metaData.links.id_ITIS = '633540'; % ITIS
metaData.links.id_EoL = '1178684'; % Ency of Life
metaData.links.id_Wiki = 'Erinaceus_europaeus'; % Wikipedia
metaData.links.id_ADW = 'Erinaceus_europaeus'; % ADW
metaData.links.id_Taxo = '60805'; % Taxonomicon
metaData.links.id_WoRMS = '1465489'; % WoRMS
metaData.links.id_MSW3 = '13600020'; % MSW3
metaData.links.id_AnAge = 'Erinaceus_europaeus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Erinaceus_europaeus}}';
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
bibkey = 'Jack2006'; type = 'Article'; bib = [ ... 
'author = {Jackson, D. B.}, ' ... 
'year = {2006}, ' ...
'title = {The breeding biology of introduced hedgehogs (\emph{Erinaceus europaeus})on a {S}cottish Island: lessons for population control and bird conservation.}, ' ...
'journal = {J. Zool}, ' ...
'volume = {268}, ' ...
'pages = {303--314}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Erinaceus_europaeus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wildpro'; type = 'Misc'; bib = ...
'howpublished = {\url{http://wildpro.twycrosszoo.org/S/0MInsectivor/Erinaceidae/Erinaceus/Erinaceus_europaeus/11WEHDetPhy.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'uksafari'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.uksafari.com/hedgehogs.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

