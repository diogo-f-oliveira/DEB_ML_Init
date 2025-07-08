function [data, auxData, metaData, txtData, weights] = mydata_Phascolarctos_cinereus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Phascolarctidae';
metaData.species    = 'Phascolarctos_cinereus'; 
metaData.species_en = 'Koala'; 

metaData.ecoCode.climate = {'BSh', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Natalie Briscoe'};    
metaData.date_subm = [2012 10 04];              
metaData.email    = {'m.kearney@unimelb.edu.au'};            
metaData.address  = {'Melbourne University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman';'Jessica Ridenour'};    
metaData.date_mod_1 = [2012 11 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 16];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 16]; 

%% set data
% zero-variate data

data.tg = 35;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'MartHand1999';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 365;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'MartHand1999';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'MartHand1999';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '1.5-2years (F), 2-5years (M) but males probably mature early just cannot hold territory, MartHand1999';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'MartHand1999';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = '13-18 yr (F), 12+yr (M), difference probably not due to longevity, MartHand1999';

data.Lb  = 0.08;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'MartHand1999';
  comment.Lb = 'Note head is disproportionately long early in development';
data.Lx  = 6;   units.Lx  = 'cm';  label.Lx  = 'total length at weaning'; bibkey.Lx  = 'guess';
  comment.Lx = 'estimate by Jess Ridenour';
data.Lp  = 12.7;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty'; bibkey.Lp  = 'MartHand1999';
data.Li  = 13.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'MartHand1999';

data.Wwb = .5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MartHand1999';
data.Wwx = 2000;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'MartHand1999';
data.Wwp = 6000;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'MartHand1999';
data.Wwi = 8300;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MartHand1999';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'MartHand1999';   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.pL  = 0.1 * 2.08e7* data.Wwi/1000 * data.Ri; units.pL  = 'J/d'; label.pL  = 'mean milk production'; bibkey.pL  = 'KrocHume1998';   
  temp.pL = C2K(36);  units.temp.pL = 'K'; label.temp.pL = 'temperature';

% uni-variate data
% time-length
data.tL = [0.1     50  90 200 400 600;    % d, time since birth
           0.08  2.6 5.0 7.0 10.4 12.0]'; % cm, physical length at f and T (from McLean 2003)
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'McLe2003';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 0;
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4FVNB'; % Cat of Life
metaData.links.id_ITIS = '552677'; % ITIS
metaData.links.id_EoL = '128425'; % Ency of Life
metaData.links.id_Wiki = 'Phascolarctos_cinereus'; % Wikipedia
metaData.links.id_ADW = 'Phascolarctos_cinereus'; % ADW
metaData.links.id_Taxo = '60425'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000005'; % MSW3
metaData.links.id_AnAge = 'Phascolarctos_cinereus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phascolarctos_cinereus}}';
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
bibkey = 'MartHand1999'; type = 'Book'; bib = [ ... 
'author = {Martin, R. and Handasyde, K.}, ' ... 
'year = {1999}, ' ...
'title = {The koala: natural history, conservation and management}, ' ...
'publisher = {UNSW Press}, ' ...
'address = {Kensington}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McLe2003'; type = 'Phdthesis'; bib = [ ... 
'author = {McLean, N.}, ' ... 
'year = {2003}, ' ...
'title = {Ecology and management of overabundant koala (\emph{Phascolarctos cinereus}) populations}, ' ...
'school = {Department of Zoology, University of Melbourne}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KrocHume1998'; type = 'Article'; bib = [ ... 
'author = {Krockenberger, A. K. and Hume, I. D. and Cork, S. J.}, ' ... 
'year = {1998}, ' ...
'title = {Production of milk and nutrition of the dependent young of free-ranging koalas (\emph{Phascolarctos cinereus})}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {71}, ' ...
'number = {1}, '...
'pages = {45--56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

