function [data, auxData, metaData, txtData, weights] = mydata_Tylototriton_verrucosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Tylototriton_verrucosus'; 
metaData.species_en = 'Himalayan newt'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.5); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 29]; 


%% set data
% zero-variate data

data.tp = 4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(19.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '3 to 5 yrs';
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4.5;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty '; bibkey.Lp  = 'PhimStua2015'; 
data.Li  = 7.5;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'PhimStua2015';
data.Lim  = 6.1;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';   bibkey.Lim  = 'PhimStua2015';

data.Wwb = 1.28e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'PhimStua2015';
  comment.Wwb = 'based on egg diameter of 2.9 mm: pi/6*0.29^3';
data.Wwi = 14.9;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'PhimStua2015';
data.Wwim = 7.9;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'PhimStua2015';

data.Ri  = 60/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(19.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '26 to 60 eggs per clutch, 1 clutch each yr';

% univariate data
% time-length
data.LdL = [ ... % SVL (cm), change in SVL (mm/month)
5.837	0.382
5.868	0.108
6.017	0.390
6.159	0.078
6.166	0.208
6.457	0.088
6.488	0.125
6.488	0.157
6.606	0.115
6.708	0.324
6.904	0.385
7.187	0.206
7.210	0.309
7.399	0.162
7.524	0.176
8.254	0.015];
data.LdL(:,2) = data.LdL(:,2)/ 305; % convert mm/month to cm/d
units.LdL  = {'cm', 'cm/d'}; label.LdL = {'SVL', 'chnage in SVL'};  
temp.LdL   = C2K(19.5); units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'PhimStua2015';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 3 * weights.LdL;
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
%F1 = '';
%metaData.bibkey.F1 = ''; 
%metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DBJZ'; % Cat of Life
metaData.links.id_ITIS = '1100696'; % ITIS
metaData.links.id_EoL = '332461'; % Ency of Life
metaData.links.id_Wiki = 'Tylototriton_verrucosus'; % Wikipedia
metaData.links.id_ADW = 'Tylototriton_verrucosus'; % ADW
metaData.links.id_Taxo = '47349'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Tylototriton+verrucosus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Tylototriton_verrucosus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tylototriton_verrucosus}}';
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
bibkey = 'PhimStua2015'; type = 'Article'; bib = [ ... 
'author = {Somphouthone Phimmachak and Bryan L. Stuart and Anchalee Aowphol}, ' ... 
'year = {2015}, ' ...
'title = {Ecology and natural history of the knobby newt \emph{Tylototriton podichthys} ({C}audata: {S}alamandridae) in {L}aos}, ' ...
'journal = {Raffles Bulletin of Zoology} , ' ...
'volume = {63}, ' ...
'pages = {389-400}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Tylototriton+verrucosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tylototriton_verrucosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

