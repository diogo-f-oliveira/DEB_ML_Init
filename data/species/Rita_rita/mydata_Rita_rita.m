  function [data, auxData, metaData, txtData, weights] = mydata_Rita_rita
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Bagridae';
metaData.species    = 'Rita_rita'; 
metaData.species_en = 'Rita'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biC'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 28];

%% set data
% zero-variate data
data.ab = 6.6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnkiKhan2023';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 33;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'JalbNare2016';
data.Li = 150;     units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 1.4e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'JalbNare2016';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwp = 335;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.01072*Lp^2.96, see F1';
data.Wwi = 29.6e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^2.96, see F1';
 
data.GSI = 0.1215; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';   bibkey.GSI = 'JalbNare2016';
  temp.GSI = C2K(22);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since hatch (yr), totla length (cm)
1	19.475
2	30.298
3	38.829
4	45.726
5	51.968
6	56.084
7	63.144];
data.tL(:,1) = (0.3 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AnkiKhan2023';
comment.tL = 'Data from rivers Ramganga, Yamunu, Ganga';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 20;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;
weights.Li = weights.Li * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01072*(TL in cm)^2.96'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4T6SG'; % Cat of Life
metaData.links.id_ITIS = '1155148'; % ITIS
metaData.links.id_EoL = '46581960'; % Ency of Life
metaData.links.id_Wiki = 'Rita_rita'; % Wikipedia
metaData.links.id_ADW = 'Rita_rita'; % ADW
metaData.links.id_Taxo = '186182'; % Taxonomicon
metaData.links.id_WoRMS = '282621'; % WoRMS
metaData.links.id_fishbase = 'Rita-rita'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Rita_rita}}';  
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
bibkey = 'AnkiKhan2023'; type = 'Article'; bib = [ ...
'doi = {10.15517/rev.biol.trop..v71i1.51734}, ' ...
'author = {Ankita Ankita and M. Afzal Khan and Salman Khan}, ' ...
'year = {2023}, ' ...
'title = {Age and growth assessment of the near-threatened fish \emph{Rita rita} ({S}iluriformes: {B}agridae) in the {G}anges basin}, ' ... 
'journal = {Revista de Biología Tropical}, ' ...
'volume = {71}, '...
'pages = {e51734}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JalbNare2016'; type = 'Article'; bib = [ ...
'doi = {10.15517/rev.biol.trop..v71i1.51734}, ' ...
'author = {Shaista Jalbani and Naeem Tariq Narejo and Pervaiz Khan and Muhammad Younis Laghari and Punhal Kahn Lashari and Yar Muhammad Jalbabi}, ' ...
'year = {2016}, ' ...
'title = {Breeding biology of catfish \empg{Rita rita} from {R}iver {I}ndus {S}indh, {P}akistan}, ' ... 
'journal = {J\"{o}kull Journal}, ' ...
'volume = {66(2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rita-rita.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

