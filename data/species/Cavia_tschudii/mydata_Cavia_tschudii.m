function [data, auxData, metaData, txtData, weights] = mydata_Cavia_tschudii 

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Caviidae';
metaData.species    = 'Cavia_tschudii'; 
metaData.species_en = 'Montane guinea pig';

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011 Bas Kooijman 2010/08/31

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2010 08 31];
metaData.email    = {'bas.kooijman@vu.nl'};
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Starrlight Augustine'};    
metaData.date_mod_1 = [2016 11 14];              
metaData.email_mod_1    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address_mod_1  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2016 11 14]; 


%% set data
% zero-variate data;

% age 0 is at onset of embryo development
data.tg = 66;      units.tg = 'd';    label.tg = 'gestation time';  bibkey.tg = 'Wiki';   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg  = '59-72 d, average 63-68 d'; 
data.tx = 17; units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = {'Wiki', 'Netvet'};   
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx  = 'wiki: start to take solid food directly after birth, netvet: peak lactation during days 5-5; agalactia by day 18-23'; 
data.tp = 68; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Netvet';  
  temp.tp = C2K(39);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp  = '30-134 d (female, mean 67.8 d), 56-70 d';
data.am = 5*365; units.am = 'd';    label.am = 'life span';     bibkey.am = 'Wiki';  
  temp.am = C2K(39);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am  = 'max = 8 yr';

data.Wwb = 90;     units.Wwb = 'g';    label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Netvet';
data.Wwx = 180;    units.Wwx = 'g';    label.Wwx = 'wet weight at weaning';           bibkey.Wwx = 'Netvet';
data.Wwi = 1200;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'Netvet';

data.Ri  = 5 * 3/ 365;  units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';        bibkey.Ri  = {'Wiki', 'Netvet'};    
  temp.Ri = C2K(39);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'wiki: 5 litters per yr, 1-6 pups per litter, max 17, average 3, netvet: females double weight by foetal mass';
  
% uni-variate data
data.tWw = [ ... % time since birth (d), wet weight (g)
              0	  74.151
          4.068	  91.530
          9.661	 156.869
         19.322	 243.956
         29.492	 300.506
         39.153	 409.400
         59.492	 483.247
         79.322	 661.775
         99.153	 766.160
        149.492	1057.640
        199.322	1187.756
        249.153	1200.116];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  bibkey.tWw = 'GeriGill2005';
temp.tWw    = C2K(39);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
comment.tWw = 'Cavia cutleri f. porcellus male';  

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
% (pseudo data are in data.psd and weights are in weights.psd)
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
if exist('comment','var')
  txtData.comment = comment;
end


%% Links
metaData.links.id_CoL = '5XGR3'; % Cat of Life
metaData.links.id_ITIS = '584714'; % ITIS
metaData.links.id_EoL = '326925'; % Ency of Life
metaData.links.id_Wiki = 'Cavia_tschudii'; % Wikipedia
metaData.links.id_ADW = 'Cavia_tschudii'; % ADW
metaData.links.id_Taxo = '89491'; % Taxonomicon
metaData.links.id_WoRMS = '1508568'; % WoRMS
metaData.links.id_MSW3 = '13400182'; % MSW3
metaData.links.id_AnAge = 'Cavia_tschudii'; % AnAge


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Montane_guinea_pig}},'...
'note = {Accessed : 2010-08-31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Netvet'; type = 'Misc'; bib = [...
'howpublished = {\url{http://netvet.wustl.edu/species/guinea/guinpig.txt}},'...
'note = {Accessed : 2015-08-12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GeriGill2005'; type = 'Article'; bib = [ ... 
'author = {Gericke, A. and Gille, U. and T. Trautvetter, T. and Salomon, F.-V.}, ' ... 
'year = {2005}, ' ...
'title = {Postnatal growth in male {D}unkin-{H}artley guineapigs (\emph{Cavia cutleri f. porcellus})}, ' ...
'journal = {Journal of Experimental Animal Science}, ' ...
'volume = {43}, ' ...
'pages = {87-99}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

