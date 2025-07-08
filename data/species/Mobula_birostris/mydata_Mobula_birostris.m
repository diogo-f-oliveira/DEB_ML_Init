function [data, auxData, metaData, txtData, weights] = mydata_Mobula_birostris

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Myliobatidae';
metaData.species    = 'Mobula_birostris'; 
metaData.species_en = 'Giant manta'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 08 21];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 09 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2020 09 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 15]; 

%% set data
% zero-variate data;
data.ab = 372;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'Wiki';    
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp is guess for all data';
data.ap = 9*365;  units.ap = 'd';   label.ap = 'age at puberty';           bibkey.ap = 'Wiki';
  temp.ap = C2K(25); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'AnAge: 2190 d';
data.am = 50*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'AnAge: 20 yr';

data.Lb = 192;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'Wiki';
  comment.Lb = 'Wiki: width 1.4 m';
data.Lp = 448;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'RambLamo2018'; 
  comment.Lp = 'for females';
data.Li  = 700;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'Wiki'; 
  comment.Li = 'Wiki: for females, width: 9 m';

data.Wwb = 9000; units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Wiki';
data.Wwi = 3e6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'for females';
  
data.Ri  = 0.3/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'RambLamo2018';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'gestation 1 yr, pregnacy interval 2 - 5 yr';

% univariate data 
% length - weight
data.LWw = [ % disc width (cm), wet weight (g)
54.731	2549.131
68.168	4017.654
69.716	4487.203
125.217	18902.422
138.131	29115.778];
units.LWw  = {'cm','g'}; label.LWw  = {'disc width','wet weight'}; 
bibkey.LWw  = 'RambLamo2018';  
comment.LWw = 'Foetal data';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 10 * weights.Wwi;
weights.Wwb = 0 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'The cost for milk secretion is added to the investment from the reproduction buffer';
D2 = 'mod_2: L-Ww data added, Wwb ignored due to inconsistency with LWw data; Ri reduced; Wwi, Lp increased';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Ovoviviparous. Myliobatiform stingrays, including the manta ray, sport "lipid histotrophy": the embryo grows to a large size in the uterus mostly by the lipid-rich "milk" secreted from the uterine wall';
metaData.bibkey.F1 = 'TomiToda2012'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '73N5T'; % Cat of Life
metaData.links.id_ITIS = '160992'; % ITIS
metaData.links.id_EoL = '49672921'; % Ency of Life
metaData.links.id_Wiki = 'Mobula_birostris'; % Wikipedia
metaData.links.id_ADW = 'Manta_birostris'; % ADW
metaData.links.id_Taxo = '42170'; % Taxonomicon
metaData.links.id_WoRMS = '1026118'; % WoRMS
metaData.links.id_fishbase = 'Manta-birostris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mobula_birostris}}';   
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Manta_birostris}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mobula-birostris.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TomiToda2012'; type = 'article'; bib = [ ...  
'author = {Tomita, T. and Toda, M. and Ueda, K. and Uchida, S. and Nakaya, K.}, ' ...
'title = {Live-bearing manta ray: how the embryo acquires oxygen without placenta and umbilical cord}, ' ...
'year = {2012}, ' ...
'doi = {10.1098/rsbl.2012.0288}, ' ...
'publisher = {The Royal Society}, ' ...
'URL = {http://rsbl.royalsocietypublishing.org/content/early/2012/06/05/rsbl.2012.0288}, ' ...
'eprint = {http://rsbl.royalsocietypublishing.org/content/early/2012/06/05/rsbl.2012.0288.full.pdf}, ' ...
'journal = {Biology Letters}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RambLamo2018'; type = 'article'; bib = [ ...  
'author = {Joshua M. Rambahiniarison and Mary Jane Lamoste and Christoph A. Rohner and Ryan Murray and Sally Snow and Jessica Labaja and Gonzalo Araujo and Alessandro Ponzo}, ' ...
'title = {Life History, Growth, and Reproductive Biology of Four Mobulid Species in the {B}ohol {S}ea, {P}hilippines}, ' ...
'year = {2018}, ' ...
'volume = {5}, ' ...
'pages = {269}, ' ...
'doi = {10.3389/fmars.2018.00269}, ' ...
'journal = {Frontiers in Marine Science}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
