function [data, auxData, metaData, txtData, weights] = mydata_Patina_pellucida
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Patellogastropoda'; 
metaData.family     = 'Patellidae';
metaData.species    = 'Patina_pellucida'; 
metaData.species_en = 'Blue-rayed limpet'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'jiMc', '0bMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'T-ab'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 24]; 

%% set data
% zero-variate data

data.am = 1.5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'GrahFret1947';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lj  = 0.1; units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';        bibkey.Lj  = 'GrahFret1947';
data.Lp  = 0.5; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty';          bibkey.Lp  = 'GrahFret1947';
data.Li  = 2.0; units.Li  = 'cm';  label.Li  = 'ultimate shell length';              bibkey.Li  = 'marlin';

data.Wwb  = 2.244e-5; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'Kess1964';
 comment.Wwb = 'based on egg diameter of 0.35 mm of Testudinalia testudinalis: pi/6*0.035^3';
data.Wdi  = 0.028; units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';  bibkey.Wdi  = 'guess';
 comment.Wdi = 'based on size-corrected value for Patella vulgata: 1.9 * (1.5/6)^3';

data.Ri  = 4.84e4/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(10);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.85';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d) at May, shell length (mm)
      0 0.1
     30 0.23
    120 0.35
    180 0.65
    240 0.85
    270 0.95
    335 1.0];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GrahFret1947';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Temperature in C for tL data is assumed to vary as T(t) = 8 + 8 * cos(2*pi*(t-180)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Patellas are frequently sequential hermaproditic';
metaData.bibkey.F1 = 'Wiki';
F2 = 'The veliger stage lasts only a few weeks';
metaData.bibkey.F2 = 'GrahFret1947';
F3 = 'Feeds on brown weeds';
metaData.bibkey.F3 = 'marlin';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '4DZW4'; % Cat of Life
metaData.links.id_ITIS = '69748'; % ITIS
metaData.links.id_EoL = '4792895'; % Ency of Life
metaData.links.id_Wiki = 'Patella_pellucida'; % Wikipedia
metaData.links.id_ADW = 'Patina_pellucida'; % ADW
metaData.links.id_Taxo = '34627'; % Taxonomicon
metaData.links.id_WoRMS = '147459'; % WoRMS
metaData.links.id_molluscabase = '147459'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Patina_pellucida}}';
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
bibkey = 'GrahFret1947'; type = 'Article'; bib = [ ... 
'doi = {10.1017/s0025315400013783}, ' ...
'author = {Alastair Graham and Vera Fretter}, ' ... 
'year = {1947}, ' ...
'title = {The Life History of \emph{Patina pellucida} ({L}.)}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {26}, ' ...
'pages = {590-601}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.marlin.ac.uk/species/detail/1298}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kess1964'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1539227}, ' ...
'author = {Margaret M. Kessel}, ' ... 
'year = {1964}, ' ...
'title = {Reproduction and larval development of \emph{Acmaea testudinalis} ({M}\"{u}leer)}, ' ...
'journal = {Biological Bulletin}, ' ...
'volume = {127}, ' ...
'pages = {294-303}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

