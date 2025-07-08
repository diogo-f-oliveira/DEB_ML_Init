function [data, auxData, metaData, txtData, weights] = mydata_Hoplostethus_mediterraneus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Trachichthyiformes'; 
metaData.family     = 'Trachichthyidae';
metaData.species    = 'Hoplostethus_mediterraneus'; 
metaData.species_en = 'Mediterranean slimehead'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 19];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 19];

%% set data
% zero-variate data

data.am = 11*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'OnghTurs1998';   
  temp.am = C2K(10.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 42;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.0082;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2.5 mm of Hoplostethus atlanticus: pi/6*0.25^3';
data.Wwp = 58;  units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01122*Lp^3.05, see F1';
data.Wwi = 1000;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.05, see F1';

data.Ri = 1e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(10.3);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  
% univariate data
data.tL = [ ... %  time since birth (yr), total length (cm)
    0    4.63
    0.5  6.32
    1    7.39
    1.5  9.81
    2   12.10
    2.5 12.90
    3   14.35
    3.5 15.03
    4   15.66
    4.5 16.45
    5   16.99
    5.5 17.80
    6   18.06
    6.5 18.28
    7   19.49
    7.5 19.75
    8   20.49
    8.5 20.62
    9   21.33
   10.5 24.20
   11   24.60];
data.tL(:,1) = 365*(0.2+data.tL(:,1));
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(10.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OnghTurs1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.01122*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3MN7T'; % Cat of Life
metaData.links.id_ITIS = '166140'; % ITIS
metaData.links.id_EoL = '217216'; % Ency of Life
metaData.links.id_Wiki = 'Hoplostethus_mediterraneus'; % Wikipedia
metaData.links.id_ADW = 'Hoplostethus_mediterraneus'; % ADW
metaData.links.id_Taxo = '192872'; % Taxonomicon
metaData.links.id_WoRMS = '126404'; % WoRMS
metaData.links.id_fishbase = 'Hoplostethus-mediterraneus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hoplostethus_mediterraneus}}';
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
bibkey = 'OnghTurs1998'; type = 'Article'; bib = [ ... 
'author = {D''Onghia, G. and A. Tursi and C.A. Marano and M. Basanisi}, ' ... 
'year = {1998}, ' ...
'title = {Life history traits of \emph{Hoplostethus mediterraneus} ({P}isces: {B}eryciformes) from the {N}orth-{W}estern {I}onian {S}ea ({M}editerranean {S}ea)}, ' ...
'journal = {J. Mar. Biol. Ass. U.K.}, ' ...
'volume = {78}, ' ...
'pages = {321-339}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Hoplostethus-mediterraneus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

