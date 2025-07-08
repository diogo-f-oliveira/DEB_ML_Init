function [data, auxData, metaData, txtData, weights] = mydata_Culaea_inconstans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Gasterosteidae';
metaData.species    = 'Culaea_inconstans'; 
metaData.species_en = 'Brook stickleback'; 

metaData.ecoCode.climate = {'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 22]; 


%% set data
% zero-variate data

data.ab = 11.5;       units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'StewReis2007';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365;     units.am = 'd';  label.am = 'life span';                 bibkey.am = 'ADW';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4.5;    units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'AcerLind1986'; 
  comment.Lp = 'besed on tp = 1 yr and tL data';
data.Li  = 8.7;    units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'biokids';
  comment.Wwb = 'based on egg diameter of 1 mm for Gasterosteus aculeatus: pi/6*0.1^3';
data.Wwp = 1.04;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'AcerLind1986','fishbase'};
  comment.Wwp = 'based on 0.01023*Lp^3.07, see F1';
data.Wwi = 7.84;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.07, see F1';

data.Ri = 182/ 365; units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'ADW';   
temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
%  t-L data from WrigWoot2004 at 19 C
data.tL = [... % time since 25 May (d), total length (cm)
40.845	2.361
84.098	3.661
102.650	3.826
365+2.107	4.357
365+14.055	4.551
365+22.706	4.869
365+35.290	5.129
365+46.339	5.357
365+58.283	5.541
365+75.064	5.645
365+89.246	6.093
365+100.433	5.912
365+127.830	5.924]; 
data.tL(:,1) = data.tL(:,1)+ 80; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AcerLind1986';


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

%% Facts
F1 = 'length - weight: Ww in g = 0.01023*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BQND'; % Cat of Life
metaData.links.id_ITIS = '166399'; % ITIS
metaData.links.id_EoL = '211904'; % Ency of Life
metaData.links.id_Wiki = 'Culaea_inconstans'; % Wikipedia
metaData.links.id_ADW = 'Culaea_inconstans'; % ADW
metaData.links.id_Taxo = '44799'; % Taxonomicon
metaData.links.id_WoRMS = '567530'; % WoRMS
metaData.links.id_fishbase = 'Culaea-inconstans'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Culaea_inconstans}}';
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
bibkey = 'AcerLind1986'; type = 'Article'; bib = [ ... 
'author = {T. O. Acere and C. C. Lindey}, ' ... 
'year = {1986}, ' ...
'title = {Age, growth and life history of \emph{Culaea inconstans} ({P}isces: {G}asterostidae) in {D}elta {M}arch {L}ake {M}anitoba}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {135}, ' ...
'pages = {35--44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StewReis2007'; type = 'techreport'; bib = [ ... 
'author = {D.B. Stewart and J.D. Reist and T.J. Carmichael and C.D. Sawatzky and N.J. Mochnacz}, ' ... 
'year = {2007}, ' ...
'title = {Fish life history and habitat use in the {N}orthwest {T}erritories: brook stickleback (\emph{Culaea inconstans})}, ' ...
'institution = {Canadian Manuscript Report of Fisheries and Aquatic Sciences}, ' ...
'volume = {2799}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Culaea-inconstans.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Culaea_inconstans/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'biokids'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.biokids.umich.edu/critters/Culaea_inconstans/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

