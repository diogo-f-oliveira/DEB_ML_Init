function [data, auxData, metaData, txtData, weights] = mydata_Procambarus_viaeviridis


%% set metaData 
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Cambaridae';
metaData.species    = 'Procambarus_viaeviridis'; 
metaData.species_en = 'Vernal crayfish'; 

metaData.ecoCode.climate = {'Cfa'}; 
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'}; 
metaData.ecoCode.gender  = {'D'}; 
metaData.ecoCode.reprod  = {'O'}; 

metaData.T_typical  = C2K(15); 
metaData.data_0     = {'am';'Lh';'Li';'Wwb';'Wwp';'Wwi';'Ri'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.0; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 08 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU Univ. Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 06]; 

%% set data
% zero-variate data
data.am = 2.5*365;    units.am = 'd';    label.am = 'life span';        bibkey.am = 'BarnAdam2017';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Mean life span of the most long-lived 10% from Vogt2010 lab population'; 

data.Li  = 2.5;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length'; bibkey.Li  = 'BarnAdam2017';

data.Wwb = 0.0053;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'RodrGarc2006';
   comment.Wwb = 'based on egg diameter of 2.22 mm for Cherax quadricarinatus: pi/6*0.222^3';
data.Wwp = 0.26;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'guess';
    comment.Wwi = 'based on same relative length-weight compared to Procambarus_virginalis: 1.53 * (2.5 /4.5)^3'; 
data.Wwi = 5.14;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'guess';
    comment.Wwi = 'based on same relative length-weight compared to Procambarus virginalis: 30 * (2.5 /4.5)^3'; 

data.Ri = 134/(8*7); units.Ri = '#/d';    label.Ri = 'max reprod rate';        bibkey.Ri = 'BarnAdam2017';
    temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';


% uni-variate data
% time - length 
data.tL = [ ... % time since birth (days), carapace length (cm)
30.073	0.307
60.866	0.639
93.022	0.693
123.118	1.094
460.575	2.416
491.993	2.371]; 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'}; bibkey.tL = 'BarnAdam2017';
temp.tL    = C2K(14.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp; 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Model  std is applied, instead of abj, since freshwater crayfish, unlike marine decapods, have no larval stage';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '7WLYR'; % Cat of Life
metaData.links.id_ITIS = '97575'; % ITIS
metaData.links.id_EoL = '1022359'; % Ency of Life
metaData.links.id_Wiki = 'Procambarus'; % Wikipedia
metaData.links.id_ADW = 'Procambarus_viaeviridis'; % ADW
metaData.links.id_Taxo = '546738'; % Taxonomicon
metaData.links.id_WoRMS = '885523'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Procambarus}}';
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
bibkey = 'BarnAdam2017'; type = 'Article'; bib = [ ...
'doi = {10.1093/jcbiol/rux073}, ' ...
'author = {Zanethia C. Barnett and Susan B. Adams and Rebecca L. Rosamond}, ' ...
'year = {2017}, ' ...
'title = {Habitat use and life history of the vernal crayfish, \emph{Procambarus viaeviridis} ({F}axon, 1914), a secondary burrowing crayfish in {M}ississippi, {U}{S}{A}}, ' ...
'journal = {Journal of Crustacean Biology}, ' ...
'volume = {37(5)}, ' ...
'pages = {544-555}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RodrGarc2006'; type = 'Article'; bib = [ ...
'author = {Rodr{\''\i}guez-Gonz{\''a}lez, Hervey and Garc{\''\i}a-Ulloa, Manuel and Hern{\''a}ndez-Llamas, Alfredo and Villarreal, Humberto}, ' ...
'year = {2006}, ' ...
'title = {Effect of dietary protein level on spawning and egg quality of redclaw crayfish \textit{Cherax quadricarinatus}},' ...
'journal = {Aquaculture}, ' ...
'volume = {257}, ' ...
'pages = {412--419}, ' ...
'doi = {10.1016/j.aquaculture.2006.01.020}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
