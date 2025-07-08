 function [data, auxData, metaData, txtData, weights] = mydata_Tridacna_gigas

%% set metadata
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Cardiida'; 
metaData.family     = 'Cardiidae';
metaData.species    = 'Tridacna_gigas'; 
metaData.species_en = 'Giant clam'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW', 'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'jiAa'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K. body temperature   
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lp'; 'Li'; 'L_t'; 'Wwb'; 'Wwi'; 'Ri'; 'dLb'; 'Ww_L'}; 
metaData.data_1     = {'t-L'}; % but presented as 0-var data

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 08 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2017 08 07]; 

%% set data
% zero-variate data;

data.ab = 20/24;       units.ab = 'd';     label.ab = 'age at birth';              bibkey.ab = 'Beck1981';  
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 7;         units.tj = 'd';    label.tj = 'time since birth at metamorphosis'; bibkey.tj = 'Beck1981';
  temp.tj = C2K(30); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 100*365;   units.am = 'd';    label.am = 'life span';                  bibkey.am = 'Wiki';   
  temp.am = C2K(30); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20;       units.Lp  = 'cm';  label.Lp  = 'shell lenght at puberty';   bibkey.Lp  = 'Wiki';
data.Li  = 137;      units.Li  = 'cm';  label.Li  = 'ultimate shell height';     bibkey.Li  = 'Wiki';

data.L10 = 2.6;        units.L10 = 'cm'; label.L10 = 'shell length at 10 month';  bibkey.L10 = 'Beck1981';
  temp.L10 = C2K(30); units.temp.L10 = 'K'; label.temp.L10 = 'temperature'; 
data.L17 = 8.3;        units.L17 = 'cm'; label.L17 = 'shell length at 17 month';  bibkey.L17 = 'Beck1981';
  temp.L17 = C2K(30); units.temp.L17 = 'K'; label.temp.L17 = 'temperature'; 
data.L9 = 52;        units.L9 = 'cm'; label.L9 = 'shell length at 9 yr';         bibkey.L9 = 'Bonh1965';
  temp.L9 = C2K(30); units.temp.L9 = 'K'; label.temp.L9 = 'temperature'; 

data.Wwb = 5.23e-7;  units.Wwb = 'g';   label.Wwb = 'wet dry weight at birth';   bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 100 mum: pi/6*0.01^3';
data.Wwi = 20e3;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Corresponds with 250 kg weight, including shells';
data.Ww115 = 17e3;   units.Ww115 = 'g'; label.Ww115 = 'wet weight at 115 cm';    bibkey.Ww115 = 'Wiki';


data.Ri  = 5e8/365;  units.Ri  = '#/d'; label.Ri  = 'ultimate reproduction rate';bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(30); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.dLj = 12/365;  units.dLj = 'cm/d';   label.dLj = 'growth rate at settlement';   bibkey.dLj = 'Beck1981';
  temp.dLj = C2K(30); units.temp.dLj = 'K'; label.temp.dLj = 'temperature';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'kap_R is set at 0.95/2 because of hermaphroditism';
D2 = 'Extremely low estimate for [p_M] probably links to symbiosis';
D3 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D4 = 'Reproduction efficiency kap_R has been set to 0.95/2 because the species is simultaneous hermaphroditic';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4);

%% Facts
F1 = 'Mantle''s edges have symbiontic zooxanthellae and the tendency to grow massive calcium carbonate shells';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Hermaphrodite';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'A single pair of the crab Xanthasia murigera  will often be found living within the cavity of the clam';
metaData.bibkey.F3 = 'EoL'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '58NJ5'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46473744'; % Ency of Life
metaData.links.id_Wiki = 'Tridacna_gigas'; % Wikipedia
metaData.links.id_ADW = 'Tridacna_gigas'; % ADW
metaData.links.id_Taxo = '39920'; % Taxonomicon
metaData.links.id_WoRMS = '207670'; % WoRMS
metaData.links.id_molluscabase = '207670'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tridacna_gigas}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S. A. L. M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Beck1981'; type = 'Article'; bib = [ ... 
'author = {N. Beckvar}, ' ... 
'year = {1981}, ' ...
'title = {CULTIVATION, SPAWNING, AND GROWTH OF THE GIANT CLAMS \emph{Tridacna gigas}, \emph{T. derasa}, AND \emph{T. squamosa} IN {P}ALAU, {C}AROLINE {I}SLANDS}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {24}, ' ...
'pages = {21--30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bonh1965'; type = 'Article'; bib = [ ... 
'author = {K. Bonham}, ' ... 
'year = {1965}, ' ...
'title = {Growth Rate of Giant Clam \emph{Tridacna gigas} at {B}ikini {A}toll as Revealed by Radioautography}, ' ...
'journal = {Science}, ' ...
'volume = {149}, ' ...
'pages = {300--302}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/2926830/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

