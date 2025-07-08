function [data, auxData, metaData, txtData, weights] = mydata_Bos_primigenius_Angus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Bos_primigenius_Angus'; 
metaData.species_en = 'Angus cattle'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'JLi'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Paulus Schuckink Kool','Bas Kooijman'};    
metaData.date_subm = [2012 08 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 16];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 16]; 

%% set data
% zero-variate data

data.tg = 282.2;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'BeltButt1992';   
  temp.tg = C2K(38.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tgm = 282.7; units.tgm = 'd';    label.tgm = 'gestation time for male calves';    bibkey.tgm = 'BeltButt1992';   
  temp.tgm = C2K(38.6);  units.temp.tgm = 'K'; label.temp.tgm = 'temperature';
data.tx = 223;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'BeltButt1992';   
  temp.tx = C2K(38.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 307;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'BeltButt1992';
  temp.tp = C2K(38.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 395.8; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'BeltButt1992';
  temp.tpm = C2K(38.6);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 18*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'BeltButt1992';   
  temp.am = C2K(38.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 31.8e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BeltButt1992';
data.Wwx = 198.7e3; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning for females'; bibkey.Wwx = 'BeltButt1992';
data.Wwxm = 230e3;  units.Wwxm = 'g';   label.Wwxm = 'wet weight at weaning for males'; bibkey.Wwxm = 'BeltButt1992';
data.Wwp = 235e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = 'BeltButt1992';
data.Wwpm = 303e3;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males'; bibkey.Wwpm = 'BeltButt1992';
data.Wwi = 460e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'BeltButt1992';
data.Wwim = 1000e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'BeltButt1992';

data.Ri  = 1/(data.tg + 63); units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'BeltButt1992';   
  temp.Ri = C2K(38.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.JXL  = 6771; units.JXL  = 'g/d'; label.JXL  = 'milkproduction';           bibkey.JXL  = 'BeltButt1992';   
  temp.JXL = C2K(38.6); units.temp.JXL = 'K'; label.temp.JXL = 'temperature';

% uni-variate data
% t-W data
data.tW_f = [ ... % time since birth (d), wet weight (g)
   1  27200;
 223 194000;
 589 369000;
1149 419800;
1830 445700;
2575 458600;
3795 459900];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight'};  
temp.tW_f    = C2K(38.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BeltButt1992';
comment.tW_f = 'Data for female, line A';
  
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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Milk digestion efficiency is very low, since milk production is much more than the calf consumes';     
D3 = 'Slow foetal development is assumed';     
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Links
metaData.links.id_CoL = '5FZBB'; % Cat of Life
metaData.links.id_ITIS = '183845'; % ITIS
metaData.links.id_EoL = '10408207'; % Ency of Life
metaData.links.id_Wiki = 'Bos_primigenius'; % Wikipedia
metaData.links.id_ADW = 'Bos_taurus'; % ADW
metaData.links.id_Taxo = '167480'; % Taxonomicon
metaData.links.id_MSW3 = '14200690'; % Mammal Spec World
metaData.links.id_AnAge = 'Bos_taurus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bos_primigenius}}';
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
bibkey = 'BeltButt1992'; type = 'Article'; bib = [ ... 
'author = {Beltr\''{a}n, J. J. and  Butts, W. T. and Olson, T. A. and Koger, M.}, ' ... 
'year = {1992}, ' ...
'title = {Growth patterns of two lines of {A}ngus cattle selected using predicted growth parameters}, ' ...
'journal = {J Anim. Sci.}, ' ...
'volume = {70}, ' ...
'pages = {734--41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bos_taurus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

