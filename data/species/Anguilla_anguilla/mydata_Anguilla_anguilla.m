  function [data, auxData, metaData, txtData, weights] = mydata_Anguilla_anguilla

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anguilliformes'; 
metaData.family     = 'Anguillidae';
metaData.species    = 'Anguilla_anguilla'; 
metaData.species_en = 'Eel'; 

metaData.ecoCode.climate = {'MB', 'MC', 'Cfb'};
metaData.ecoCode.ecozone = {'MAN', 'THp'};
metaData.ecoCode.habitat = {'0jMpe', 'jpFl', 'jpFp', 'jpFr', 'piMd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Jaap van der Meer'};        
metaData.date_subm = [2011 02 22];                           
metaData.email    = {'jaap.van.der.meer@nioz.nl'};                 
metaData.address  = {'NIOZ, Texel, the Netherlands'}; 

metaData.author_mod_1  = {'Bas Kooijman'};                  
metaData.date_mod_1    = [2013 08 19];                      
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};      
metaData.address_mod_1 = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 12 22]; 


%% set data
% zero-variate data
data.ab = 41.5/24;units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Wiki'; 
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 5*365;  units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'Wiki';
  temp.ap = C2K(10); units.temp.ap = 'K'; label.temp.ap = 'temperature'; 
data.am = 55*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.48;   units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'Wiki';
data.Lp = 30;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Wiki';
data.Li = 133;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Wiki';

data.Wwb = 0.0014 * data.Lb^3; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Wiki';
data.Wwp = 44;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'Wiki';
data.Wwi = 3500;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';
  
data.Ri = 1.4e6/(6*365);  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data at unknown f and T = 273 + 10
% These field data are from Penaz and Tesch (1970) as given in Tesch (2003) p. 173 Table 3.10 last row
% The time since birth is unknown
data.tL = [     (1:12)*365;       % d, time since glasseel influx
       9.4     15.3    23.2    26.4    30.0    33.7    38.6    43.9     52.8     54.8     64.0     70.7]'; % cm, physical length at f and T
units.tL = {'d', 'cm'};     label.tL = {'time since glasseel influx', 'total length'};  
  temp.tL = C2K(10); units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = {'PenaTesc1970','Tesc2003'};

% t-W data at f = 1 and T = 273 + 21.5
% These laboratory data are from Angelidis et al. (2005)  
data.tW = [0 46 76 115 157 198 241 276 328;    % d, time since glasseel influx
        0.3 0.89 2.7 5.7 10 30 40 67 90]';  % g, weight at f and T
units.tW = {'d', 'g'};     label.tW = {'time since glasseel influx', 'wet weight'};  
  temp.tW = C2K(21.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = {'AngePour2005'};

% L-W data at unknown f and unknown T
% These field data are from Tesch (2003) p. 177 Table 3.12
L = [6:70,75,80,85,90,95,100]+0.5;
W1 = [0.5,0.5,0.8,1.1,1.2,1.7,2.3,3.2,4.0,4.6,7.4,7.7,9.0,10.2,13.1,15.0,16.3,18.2,22.7,24.9,25.8,32.4];
W2 = [36.3,43.1,  45.0,49.0,59.5,59.6,61.2,71.2,78.8,82.1,97.6,96.2,115.0,126.3,130.1,147.6,142.7];
W3 = [164.3,174.2,173.0,195.8,202.6,227.6,229.8,257.6,266.3,296.8,305.2,324.7,365.6,353.2,373.7,399.2];
W4 = [399.0,415.8,504.8,448,517.5,590,481,465,665,729,771,1046,1208,1563,1800,1622];
data.LW = [L;W1,W2,W3,W4]';
units.LW = {'d', 'g'};     label.LW = {'time', 'wet weight'};  
bibkey.LW = {'Tesc2003'};

%% set weights for all real data
weights = setweights(data, []);
weights.tW(6:9) = 10 * weights.tW(6:9);
weights.LW(60:71) = 10 * weights.LW(60:71);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Discussion points
D1 = 'The embryo and early juvenile stages were bypassed in the analysis';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'DZZN'; % Cat of Life
metaData.links.id_ITIS = '161128'; % ITIS
metaData.links.id_EoL = '46561251'; % Ency of Life
metaData.links.id_Wiki = 'Anguilla_anguilla'; % Wikipedia
metaData.links.id_ADW = 'Anguilla_anguilla'; % ADW
metaData.links.id_Taxo = '42526'; % Taxonomicon
metaData.links.id_WoRMS = '126281'; % WoRMS
metaData.links.id_fishbase = 'Anguilla-anguilla'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anguilla_anguilla}}';  
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
bibkey = 'AngePour2005'; type = 'Article'; bib = [ ...  
'author = {Angelidis, P. and Pournara, I. and Photis, G.}, ' ...
'year = {2005}, ' ...
'title = {Glass eels (\emph{Anguilla anguilla}) growth in a recirculating system.}, ' ... 
'journal = {Mediterranean Marine Science}, ' ...
'volume = 4, '...
'pages = {99--106}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PenaTesc1970'; type = 'Article'; bib = [ ...    
'author = {Penaz, M. and Tesch, F.W.}, ' ...
'year  = {1970}, ' ...
'title = {Sex rate and growth of eel (\emph{Anguilla anguilla}) in different biotopes of {N}orth {S}ea and {R}iver {E}lbe..}, ' ...  
'journal = {Berichte der Deutschen Wissenschaftlichen Kommission f\"{u}r Meeresforschung}, ' ...
'volume = {21}, ' ...
'pages = {290}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tesc2003'; type = 'Book'; bib = [ ...    
'author = {Tesch, F.W.}, ' ...
'year  = {2003}, ' ...
'title = {The Eel}, ' ...  
'publisher = {Blackwell}, ' ...
'address = {Oxford}, '...
'note = {p. 173 Table 3.10 last row}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 

